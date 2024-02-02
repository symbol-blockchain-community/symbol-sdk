from .AbstractTypeFormatter import AbstractTypeFormatter, MethodDescriptor
from .printers import create_pod_printer


class PodTypeFormatter(AbstractTypeFormatter):
	def __init__(self, ast_model):
		super().__init__()

		# array or int
		self.pod = ast_model
		self.printer = create_pod_printer(self.pod)

	@property
	def typename(self):
		return self.pod.name

	@property
	def field_name(self):
		return f'this._{self.printer.name}'

	@property
	def _is_array(self):
		return self.pod.display_type.is_array

	def get_fields(self):
		return [f'static SIZE = {self.pod.size};']

	def get_base_class(self):
		return 'ByteArray' if self._is_array else 'BaseValue'

	def get_ctor_descriptor(self):
		variable_name = self.printer.name
		size = self.printer.get_size()
		body = f'super({self.typename}.SIZE, {variable_name});'
		
		if self._is_array:
			arg_type = 'Uint8Array | string'
			arguments = [f'{variable_name}: {arg_type} = {self.printer.get_default_value()}']
		else:
			arg_type = 'bigint | string' if size == 8 else 'number | string'
			arguments = [f'{variable_name}: {arg_type} = {self.printer.get_default_value()}']

		return MethodDescriptor(body=body, arguments=arguments)

	def get_deserialize_descriptor(self):
		body = 'const byteArray = payload;\n'
		body += f'return new {self.typename}({self.printer.load()});'
		result = f': {self.typename}'
		return MethodDescriptor(body=body, result=result)

	def get_deserialize_aligned_descriptor(self):
		if self._is_array:
			return None

		body = 'const byteArray = payload;\n'
		body += f'return new {self.typename}({self.printer.load("byteArray", True)});'
		result = f': {self.typename}'
		return MethodDescriptor(body=body, result=result)

	def get_serialize_descriptor(self):
		result = f': Uint8Array'
		if self._is_array:
			return MethodDescriptor(body='return this.bytes;', result=result)

		return MethodDescriptor(body=f'return {self.printer.store("this.value")};', result=result)

	def get_size_descriptor(self):
		if not self._is_array:
			return None

		body = f'return {self.pod.size};\n'
		return MethodDescriptor(body=body)
