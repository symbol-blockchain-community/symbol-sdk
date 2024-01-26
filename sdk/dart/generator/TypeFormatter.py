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
		super = method_descriptor.super if method_descriptor.super else ''
		arguments = ', '.join(method_descriptor.arguments)
		if len(arguments) > 100:
			arguments = '\n' + ',\n'.join(method_descriptor.arguments) + '\n'
		
		if len(method_descriptor.arguments) > 1:
			arguments = f'{{ {arguments}}}'
		#elif len(method_descriptor.arguments) == 1 and not 'set ' in method_descriptor.method_name:
		#	arguments = f'[{arguments}]'
		if not 'get ' in method_descriptor.method_name:
			arguments = '(' + arguments + ')'
		annotations = '\n'.join(method_descriptor.annotations + [''])

		method_result = f'{method_descriptor.result} ' if method_descriptor.result else ''
		body = f'{{\n{indent(method_descriptor.body)}}}' if method_descriptor.body else ';'
		if method_descriptor.is_enum_ctor:
			return f'{method_descriptor.method_name}{arguments} {method_descriptor.body}'
		return f'{annotations}{method_result}{method_descriptor.method_name}{arguments} {super}{body}'

	def generate_class_header(self):
		base_class = self.provider.get_base_class()
		base_class = f' extends {base_class}' if base_class else ''
		interface = self.provider.get_interface()
		base_class += f' implements IDeserializable{interface}' if interface else ' implements IDeserializable'
		header = f'class {self.provider.typename}{base_class} {{\n'
		comment = ''
		return header + indent(comment)
	
	def generate_class(self):
		output = self.generate_class_header()

		fields = self.provider.get_fields()
		fields_output = ''
		for field in fields:
			fields_output += indent(field)

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

		method_descriptor.method_name = self.provider.typename
		return self.generate_method(method_descriptor)

	def generate_comparer(self):
		method_descriptor = self.provider.get_comparer_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'comparer'
		method_descriptor.arguments = []
		method_descriptor.result = 'Tuple2'
		return self.generate_method(method_descriptor)

	def generate_sort(self):
		method_descriptor = self.provider.get_sort_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'sort'
		method_descriptor.arguments = []
		method_descriptor.result = 'void'
		return self.generate_method(method_descriptor)

	def generate_deserializer(self):
		# 'deserialize'
		method_descriptor = self.provider.get_deserialize_descriptor()
		method_descriptor.method_name = 'deserialize'
		method_descriptor.arguments = ['dynamic payload']
		method_descriptor.result = self.provider.typename
		method_descriptor.annotations = ['@override']
		return self.generate_method(method_descriptor)

	def generate_serializer(self):
		method_descriptor = self.provider.get_serialize_descriptor()
		method_descriptor.method_name = 'serialize'
		method_descriptor.result = 'Uint8List'
		return self.generate_method(method_descriptor)

	def generate_size(self):
		method_descriptor = self.provider.get_size_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'get size'
		method_descriptor.arguments = []
		method_descriptor.result = 'int'
		return self.generate_method(method_descriptor)
	
	def generate_getters(self):
		return list(map(self.generate_method, self.provider.get_getter_descriptors()))

	def generate_setters(self):
		return list(map(self.generate_method, self.provider.get_setter_descriptors()))

	def generate_representation(self):
		method_descriptor = self.provider.get_str_descriptor()
		if not method_descriptor:
			return None

		method_descriptor.method_name = 'toString'
		method_descriptor.result = 'String'
		method_descriptor.annotations = ['@override']
		return self.generate_method(method_descriptor)

	def generate_methods(self):
		methods = []

		_append_if_not_none(methods, self.generate_ctor())
		_append_if_not_none(methods, self.generate_comparer())
		_append_if_not_none(methods, self.generate_sort())

		getters = self.generate_getters()
		methods.extend(getters)
		setters = self.generate_setters()
		methods.extend(setters)

		_append_if_not_none(methods, self.generate_size())

		methods.append(self.generate_deserializer())
		methods.append(self.generate_serializer())

		_append_if_not_none(methods, self.generate_representation())

		return methods

	def __str__(self):
		return self.generate_output()
