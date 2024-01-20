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
		return f'self._{self.printer.name}'

	@property
	def _is_array(self):
		return self.pod.display_type.is_array

	def get_fields(self):
		return [f'static const int SIZE = {self.pod.size};']

	def get_base_class(self):
		return 'ByteArray' if self._is_array else 'BaseValue'

	def get_ctor_descriptor(self):
		variable_name = self.printer.name
		if self._is_array:
			super = f': super(SIZE, {variable_name} ?? {self.printer.get_default_value()})'
			arguments = [f'Uint8List {variable_name}']
		else:
			super = f': super(SIZE, {variable_name} ?? {self.printer.get_default_value()})'
			arguments = [f'{self.printer.get_type()} {variable_name}']
		return MethodDescriptor(super=super, arguments=arguments)

	def get_deserialize_descriptor(self):
		if self._is_array:
			return MethodDescriptor(body=f'return {self.typename}({self.printer.load()});')
		
		body = 'var buffer = ByteData.view(payload.buffer);\n'
		body += f'return {self.typename}({self.printer.load()});'
		return MethodDescriptor(body=body)

	def get_serialize_descriptor(self):
		body = 'var buffer = ByteData(SIZE);\n'
		body += f'return {self.printer.store("value")};'
		if self._is_array:
			return MethodDescriptor(body='return bytes')

		return MethodDescriptor(body=body)

	def get_size_descriptor(self):
		if not self._is_array:
			return None

		body = f'return {self.pod.size}\n'
		return MethodDescriptor(body=body)
