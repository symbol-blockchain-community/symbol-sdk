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
		return f'$this->{self.printer.name}'

	@property
	def _is_array(self):
		return self.pod.display_type.is_array

	def get_fields(self):
		return []

	def get_base_class(self):
		return 'BinaryData' if self._is_array else 'BaseValue'

	def get_ctor_descriptor(self):
		variable_name = f'${self.printer.name}'
		body = ''
		if self._is_array:
			body += f'{variable_name} = {variable_name} ?? str_repeat("\\x00", self::size());\n'
		body += f'parent::__construct({self.pod.size}, {variable_name});'
		if self._is_array:
			arguments = [f'string {variable_name} = {self.printer.get_default_value()}']
		else:
			arguments = [f'{variable_name} = {self.printer.get_default_value()}']

		return MethodDescriptor(body=body, arguments=arguments)

	def get_deserialize_descriptor(self):
		return MethodDescriptor(body=f'return new self({self.printer.load()});', result='self')

	def get_deserialize_aligned_descriptor(self):
		if self._is_array:
			return None
		return MethodDescriptor(body=f'return new self({self.printer.load()});', result='self')

	def get_serialize_descriptor(self):
		if self._is_array:
			return MethodDescriptor(body='return $this->binaryData;', result='string')
		return MethodDescriptor(body=f'return {self.printer.store("$this->value")};', result='string')

	def get_size_descriptor(self):
		body = f'return {self.pod.size};\n'
		return MethodDescriptor(body=body, result='int')
