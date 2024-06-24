from .AbstractTypeFormatter import AbstractTypeFormatter, MethodDescriptor
from .format import wrap_lines
from .printers import IntPrinter


class EnumTypeFormatter(AbstractTypeFormatter):
	def __init__(self, ast_model):
		super().__init__()

		self.enum_type = ast_model

		self.int_printer = IntPrinter(self.enum_type)

	@property
	def typename(self):
		return self.enum_type.name

	def get_fields(self):
		return list(
			map(
				lambda e: f'const {e.name} = {e.value};\n',
				self.enum_type.values,
			)
		) + ['public $value;']

	def get_ctor_descriptor(self):
		arguments = [f'int $value = {self.int_printer.get_default_value()}']
		body = '$this->value = $value;'
		return MethodDescriptor(body=body, arguments=arguments)

	def _get_deserialize_descriptor(self, is_aligned):
		return MethodDescriptor(body=f'return new {self.typename}({self.int_printer.load()});', result='self')

	def get_deserialize_descriptor(self):
		return self._get_deserialize_descriptor(is_aligned=False)

	def get_deserialize_aligned_descriptor(self):
		return self._get_deserialize_descriptor(is_aligned=True)

	def get_serialize_descriptor(self):
		return MethodDescriptor(body=f'return {self.int_printer.store("$this->value")};', result='string')

	def get_size_descriptor(self):
		body = f'return {self.enum_type.size};\n'
		return MethodDescriptor(body=body)

	def generate_key_value_arrays(self):
		values = list(map(lambda e: str(e.value), self.enum_type.values))
		keys = list(map(lambda e: f'\'{e.name}\'', self.enum_type.values))

		result = wrap_lines(values, '$values = [', '];\n', 4 * 3)
		result += wrap_lines(keys, '$keys = [', '];\n', 4 * 3)
		return result

	def get_value_to_key_descriptor(self):
		body = self.generate_key_value_arrays()
		body += '''
$index = array_search($value, $values);
if ($index === false)
	throw new Exception("Invalid enum value: {$value}");

return $keys[$index];
'''
		return MethodDescriptor(method_name='static function valueToKey', body=body, arguments=['$value'])

	def get_getter_setter_descriptors(self):
		methods = []

		if self.enum_type.is_bitwise:
			body = 'return 0 !== ($this->value & $flag);\n'
			methods.append(MethodDescriptor(method_name='public function has', arguments=['$flag'], body=body, result='bool'))
		else:
			methods.append(self.get_value_to_key_descriptor())

		return methods

	def get_str_descriptor(self):
		if not self.enum_type.is_bitwise:
			return MethodDescriptor(body=f'return "{self.typename}." . self::valueToKey($this->value);')

		body = self.generate_key_value_arrays()
		body += f'''
if ($this->value === 0) {{
	$index = array_search($this->value, $values);
	return "{self.typename}.{{$keys[$values[$index]]}}";
}}

$positions = array_keys(array_filter($values, fn ($flag) => ($this->value & $flag) !== 0));
$result = array_map(fn ($n) => "{self.typename}.{{$keys[$n]}}", $positions);

return implode('|', $result);
'''
		return MethodDescriptor(body=body)
