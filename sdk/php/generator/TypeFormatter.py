from abc import ABC, abstractmethod

from .format import indent


class ClassFormatter(ABC):
	def __init__(self, provider):
		self.provider = provider

	@abstractmethod
	def generate_methods(self):
		raise NotImplementedError('need to override method')

	@staticmethod
	def generate_method(method_descriptor):
		arguments = ', '.join(method_descriptor.arguments)
		if len(arguments) > 100:
			arguments = '\n\t' + ',\n\t'.join(method_descriptor.arguments) + '\n'

		method_result = f': {method_descriptor.result} ' if method_descriptor.result else ''
		body = indent(method_descriptor.body)
		return f'{method_descriptor.method_name}({arguments}){method_result}{{\n{body}}}\n'

	def generate_class_header(self):
		base_class = self.provider.get_base_class()
		base_class = f' extends {base_class}' if base_class else ''
		header = f'class {self.provider.typename}{base_class} {{\n'
		comment = ''
		return header + indent(comment)

	def generate_class(self):
		output = self.generate_class_header()

		# additional newline between fields for js linter
		fields = self.provider.get_fields()
		fields_output = indent('\n'.join(fields))

		if fields_output:
			output += fields_output + '\n'

		methods = self.generate_methods()
		output += '\n'.join(map(indent, methods))

		output += '}\n'  # class_footer
		return output

	def generate_output(self):
		output = self.generate_class()
		return output

	def __str__(self):
		return self.generate_output()


def _append_if_not_none(methods, descriptor):
	if not descriptor:
		return

	methods.append(descriptor)


class TypeFormatter(ClassFormatter):
	def generate_ctor(self):
		method_descriptor = self.provider.get_ctor_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'public function __construct'
		return self.generate_method(method_descriptor)

	def generate_comparer(self):
		method_descriptor = self.provider.get_comparer_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'comparer'
		method_descriptor.arguments = []
		return self.generate_method(method_descriptor)

	def generate_sort(self):
		method_descriptor = self.provider.get_sort_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'public function sort'
		method_descriptor.arguments = []
		if not method_descriptor.body:
			method_descriptor.disabled_warnings = ['class-methods-use-this']

		return self.generate_method(method_descriptor)

	def generate_deserializer(self, name, generated_name=None):
		if not hasattr(self.provider, f'get_{name}_descriptor'):
			return None

		descriptor_getter = getattr(self.provider, f'get_{name}_descriptor')
		method_descriptor = descriptor_getter()
		if not method_descriptor:
			return None

		generated_name = generated_name or name
		method_descriptor.method_name = f'public static function {generated_name}' if not method_descriptor.method_name else method_descriptor.method_name
		method_descriptor.arguments = ['BinaryReader $reader'] if not method_descriptor.arguments else method_descriptor.arguments
		method_descriptor.result = '' if not method_descriptor.result else method_descriptor.result

		return self.generate_method(method_descriptor)

	def generate_serializer(self):
		method_descriptor = self.provider.get_serialize_descriptor()
		method_descriptor.method_name = 'public function serialize' if not method_descriptor.method_name else method_descriptor.method_name
		method_descriptor.result = 'string'
		return self.generate_method(method_descriptor)

	def generate_serializer_protected(self):
		method_descriptor = self.provider.get_serialize_protected_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'public function _serialize'
		method_descriptor.arguments = ['BinaryWriter &$writer']
		method_descriptor.result = 'void'
		return self.generate_method(method_descriptor)

	def generate_size(self):
		method_descriptor = self.provider.get_size_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'public static function size' if not method_descriptor.method_name else method_descriptor.method_name
		method_descriptor.arguments = []
		return self.generate_method(method_descriptor)

	def generate_getters_setters(self):
		return list(map(self.generate_method, self.provider.get_getter_setter_descriptors()))

	def generate_representation(self):
		method_descriptor = self.provider.get_str_descriptor()
		if not method_descriptor:
			return None
		
		method_descriptor.method_name = 'public function __toString' if method_descriptor.method_name is None else method_descriptor.method_name
		return self.generate_method(method_descriptor)

	def generate_methods(self):
		methods = []

		_append_if_not_none(methods, self.generate_ctor())
		_append_if_not_none(methods, self.generate_comparer())
		_append_if_not_none(methods, self.generate_sort())

		methods.extend(self.generate_getters_setters())

		_append_if_not_none(methods, self.generate_size())

		methods.append(self.generate_deserializer('deserialize'))

		methods.append(self.generate_serializer())
		_append_if_not_none(methods, self.generate_serializer_protected())

		_append_if_not_none(methods, self.generate_representation())

		return methods

	def __str__(self):
		return self.generate_output()
