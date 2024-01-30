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
		method_descriptor.method_name = 'deserialize'
		method_descriptor.arguments = ['dynamic payload']
		method_descriptor.result = 'dynamic'
		method_descriptor.annotations = ['@override']
		return self.generate_method(method_descriptor)
	
	def generate_serializer(self):
		method_descriptor = self.provider.get_serialize_descriptor()
		method_descriptor.method_name = 'serialize'
		method_descriptor.arguments = ['']
		method_descriptor.result = 'Uint8List'
		method_descriptor.annotations = ['@override']
		return self.generate_method(method_descriptor)

	def generate_create_by_name(self):
		method_descriptor = self.provider.get_create_by_name_descriptor()
		method_descriptor.method_name = 'createByName'
		method_descriptor.arguments = ['String entityName']
		return self.generate_method(method_descriptor)

	def generate_methods(self):
		methods = []
		methods.append(self.generate_deserializer())
		methods.append(self.generate_create_by_name())
		methods.append(self.generate_serializer())
		return methods


class FactoryFormatter(AbstractTypeFormatter):
	def __init__(self, factory_map, abstract_model):
		super().__init__()

		# array or int
		self.abstract = abstract_model
		self.printer = BuiltinPrinter(abstract_model, 'parent')
		self.factory_descriptor = factory_map.get(self.abstract.name, None)

	def get_ctor_descriptor(self):
		raise NotImplementedError('`get_ctor_descriptor` not supported by FactoryFormatter')

	@property
	def typename(self):
		return f'{self.abstract.name}Factory'
	
	def create_discriminator(self, name):
		field_names = self.factory_descriptor.discriminator_values
		first_field = f'{name}.{field_names[0]}.value'
		if not len(field_names) > 1:
			return f'{first_field}: {name}()'
		remaining_fields = ', '.join(f'{name}.{field}' for field in field_names[1:])
		return f'({first_field}, {remaining_fields}): {name}()'

	def get_deserialize_descriptor(self):
		body = 'if(payload is String){\n'
		body += '\ttryHexString(payload);\n'
		body += '\tpayload = hex.decode(payload);\n'
		body += '}\n'
		body += 'Uint8List buffer = payload.buffer.asUint8List();\n'
		body += f'var {self.printer.name} = {self.printer.load()};\n'

		if self.factory_descriptor:
			names = [f'{concrete.name}' for concrete in self.factory_descriptor.children]
			if len(self.factory_descriptor.discriminator_values) > 1:
				body += f'var mapping = <(int, int), ISerializable>{{\n'
				body += indent(
				',\n'.join(map(self.create_discriminator, names))
				)
			else:
				body += f'var mapping = <int, ISerializable>{{\n'
				body += indent(
				',\n'.join(map(self.create_discriminator, names))
				)
		else:
			body += 'var mapping = {\n'

		body += '};\n'

		discriminators = [] if not self.factory_descriptor else self.factory_descriptor.discriminator_names
		values = ', '.join(map(lambda discriminator: f'{self.printer.name}.{discriminator}.value' 
			if discriminator == discriminators[0] else f'{self.printer.name}.{discriminator}', discriminators))
		body += f'var discriminator = ({values});\n'
		body += 'if (mapping[discriminator] != null) {\n'
		body += '	var factory_class = mapping[discriminator]!;\n'
		body += '	return factory_class.deserialize(buffer);\n'
		body += '} else {\n'
		body += '	throw Exception(\'Null value found for mapping[discriminator]\');\n'
		body += '}\n'
		return MethodDescriptor(body=body, result=self.abstract.name)

	def get_create_by_name_descriptor(self):
		body = ''
		body += 'var mapping = <String, ISerializable Function()>{\n'
		body += indent(
			',\n'.join(
				map(
					lambda child: f'\'{skip_embedded(underline_name(child.name))}\': () => {child.name}()',
					[] if not self.factory_descriptor else self.factory_descriptor.children
				)
			)
		)
		body += '};\n'

		body += f'''
if (!mapping.containsKey(entityName)) {{
	throw Exception('Unknown Transaction type $entityName');
}}

return mapping[entityName]!();
'''
		return MethodDescriptor(body=body, result='ISerializable')

	def get_serialize_descriptor(self):
		body = "throw UnimplementedError('do not need serialize for factory');"
		return MethodDescriptor(body=body)

	def get_size_descriptor(self):
		raise RuntimeError('not required')

