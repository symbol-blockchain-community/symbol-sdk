from catparser.ast import FixedSizeInteger

from .AbstractTypeFormatter import AbstractTypeFormatter, MethodDescriptor
from .format import indent
from .name_formatting import fix_name, underline_name
from .printers import BuiltinPrinter
from .TypeFormatter import ClassFormatter


# hack: skip embedded from names
def skip_embedded(name):
	if not name.startswith('embedded_'):
		return name

	return name[len('embedded_'):]


class FactoryClassFormatter(ClassFormatter):
	def generate_deserializer(self):
		method_descriptor = self.provider.get_deserialize_descriptor()
		method_descriptor.method_name = 'public static function deserialize'
		method_descriptor.arguments = ['$binaryData']
		return self.generate_method(method_descriptor)

	def generate_create_by_name(self):
		method_descriptor = self.provider.get_create_by_name_descriptor()
		method_descriptor.method_name = 'static createByName'
		method_descriptor.arguments = [
			'entityName'
		]
		return self.generate_method(method_descriptor)

	def generate_methods(self):
		methods = []
		getters_setters = self.generate_getters_setters()
		methods.extend(getters_setters)
		methods.append(self.generate_deserializer())
		# methods.append(self.generate_create_by_name())
		return methods

	def generate_getters_setters(self):
		return list(map(self.generate_method, self.provider.get_getter_setter_descriptors()))


class FactoryFormatter(AbstractTypeFormatter):
	def __init__(self, factory_map, abstract_model):
		super().__init__()

		# array or int
		self.abstract = abstract_model
		self.printer = BuiltinPrinter(abstract_model, 'parent')
		self.factory_descriptor = factory_map.get(self.abstract.name)

	def get_ctor_descriptor(self):
		raise NotImplementedError("'get_ctor_descriptor' not supported by FactoryFormatter")

	@property
	def typename(self):
		return f'{self.abstract.name}Factory'

	@staticmethod
	def map_to_value(name, value, field_type):
		return f'{name}->{value}' if isinstance(field_type, FixedSizeInteger) else f'{name}->{value}->value'

	def create_discriminator(self, name):
		field_values = self.factory_descriptor.discriminator_values
		field_types = self.factory_descriptor.discriminator_types

		values = ', '.join(f'{name}::{value}' for value, field_type in zip(field_values, field_types))
		return f'self::toKey([{values}]) => {name}::class,'

	def get_deserialize_descriptor(self):
		body = '$reader = new BinaryReader($binaryData);\n'
		body += f'${self.printer.name} = new {self.printer.get_type()}();\n'
		body += f'{self.printer.get_type()}::_deserialize($reader, $parent);\n'

		body += '$reader->setPosition(0);\n'

		body += '$mapping = [\n'

		if self.factory_descriptor:
			names = [f'{concrete.name}' for concrete in self.factory_descriptor.children]
			body += '\n'.join(map(self.create_discriminator, names))

		body += '];\n'

		discriminators = [] if not self.factory_descriptor else self.factory_descriptor.discriminator_names
		discriminator_types = self.factory_descriptor.discriminator_types

		values = ', '.join(map(lambda value_type: self.map_to_value(f'${self.printer.name}', *value_type), zip(discriminators, discriminator_types)))
		body += f'$discriminator = self::toKey([{values}]);\n'
		body += 'if (!array_key_exists($discriminator, $mapping)) {\n'
		body += f'\tthrow new Exception("Unknown {self.printer.get_type()} type");\n'
		body += '}\n'
		body += '$factoryClass = $mapping[$discriminator];\n'
		body += "return call_user_func([$factoryClass, 'deserialize'], $reader);"

		return MethodDescriptor(body=body)

	def get_create_by_name_descriptor(self):
		body = ''
		body += '$mapping = {\n'
		body += indent(
			',\n'.join(
				map(
					lambda child: f'{skip_embedded(underline_name(child.name))}: {child.name}',
					[] if not self.factory_descriptor else self.factory_descriptor.children
				)
			)
		)
		body += '};\n'

		body += f'''
if (!Object.prototype.hasOwnProperty.call(mapping, entityName))
	throw new RangeError('unknown {self.printer.get_type()} type ${{entityName}}');

return new mapping[entityName]();
'''
		return MethodDescriptor(body=body)

	def get_serialize_descriptor(self):
		raise RuntimeError('not required')

	def get_size_descriptor(self):
		raise RuntimeError('not required')

	def get_getter_setter_descriptors(self):
		# toKey is a helper method that is used to create map keys, that are used inside factory's deserialize method
		methods = []
		body = '''if (count($values) === 1) {
	return $values[0];
}

// assume each key is at most 32bits
return array_reduce(array_map('intval', $values), function ($accumulator, $value) {
	return ($accumulator << 32) + $value;
}, 0);
'''
		methods.append(MethodDescriptor(method_name='public static function toKey', arguments=['$values'], body=body))
		return methods
