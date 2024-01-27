from catparser.DisplayType import DisplayType

from .name_formatting import lang_field_name, fix_size_name, underline_name

def plural_to_singular(word):
	if word.endswith('s'):
			return word[:-1]
	else:
			return word

def embedded_name(name):
	return name.replace("Embedded", "IEmbedded")

class Printer:
	def __init__(self, descriptor, name):
		self.descriptor = descriptor
		# printer.name is 'fixed' field name
		self.name = lang_field_name(name or underline_name(self.descriptor.name))

	def sort(self, _field_name):  # pylint: disable=no-self-use
		return None


class IntPrinter(Printer):
	def __init__(self, descriptor, name=None):
		super().__init__(descriptor, name)
		self.type_hint = None

	def get_type(self):
		return 'int'

	def get_default_value(self):
		return '0'

	def get_size(self):
		return self.descriptor.size

	def load(self, buffer_name='buffer'):
		data_size = self.get_size()
		return f'bytesToInt({buffer_name}.sublist(0, {data_size}), {data_size})'

	def advancement_size(self):
		return self.get_size()

	def store(self, field_name, pos):
		data_size = self.get_size()
		return f'buffer.setRange({pos}, {pos} + {data_size}, intToBytes({field_name}, {data_size}))'

	@staticmethod
	def modifier():
		return f'const'

	@staticmethod
	def assign(value):
		return str(value)

	@staticmethod
	def to_string(field_name, size):
		return f'0x${{{field_name}.toRadixString(16).padLeft({size} * 2, \'0\').toUpperCase()}}'


class TypedArrayPrinter(Printer):
	def __init__(self, descriptor, name=None):
		super().__init__(descriptor, name)
		self.type_hint = f'array[{self.descriptor.field_type.element_type}]'

	def get_type(self):
		return f'List<{self.descriptor.field_type.element_type}>'

	@staticmethod
	def get_default_value():
		return '[]'

	@property
	def is_variable_size(self):
		# note: self.descriptor.field_type.alignment condition at the end is needed to filter out receipts
		descriptor = self.descriptor
		return (descriptor.field_type.is_byte_constrained or descriptor.extensions.is_contents_abstract) and descriptor.field_type.alignment

	def get_size(self):
		if self.is_variable_size:
			alignment = self.descriptor.field_type.alignment
			skip_last_element_padding = not self.descriptor.field_type.is_last_element_padded
			return f'ArrayHelpers.size({self.name}, {alignment}, {str(skip_last_element_padding).lower()})'

		return f'ArrayHelpers.size({self.name})'

	def _get_sort_comparer(self, variable_name):
		sort_key = lang_field_name(self.descriptor.field_type.sort_key)
		comparer = f'return ArrayHelpers.getValue({variable_name}.{sort_key});'
		return comparer

	def _get_sort_accessor(self):
		accessor = f'(e) {{ {self._get_sort_comparer("e")}}}'
		return accessor

	def load(self, buffer_name='buffer'):
		element_type = self.descriptor.field_type.element_type

		# use either type name or if it's an abstract type use a factory instead
		if self.descriptor.extensions.is_contents_abstract:
			element_type = f'{element_type}Factory'

		if self.is_variable_size:
			buffer_view = 'buffer'
			if not self.descriptor.field_type.is_expandable:
				data_size = lang_field_name(self.descriptor.size)
				buffer_view = f'buffer.sublist(0, {data_size})'

			alignment = self.descriptor.field_type.alignment
			skip_last_element_padding = f'{not self.descriptor.field_type.is_last_element_padded}'
			return f'ArrayHelpers.readVariableSizeElements({buffer_view}, {element_type}(), {alignment}, {str(skip_last_element_padding).lower()}).map((item) => item as {embedded_name(self.descriptor.field_type.element_type)}).toList()'

		if self.descriptor.field_type.is_expandable:
			return f'ArrayHelpers.readArray(buffer, {element_type}()).map((item) => item as {self.descriptor.field_type.element_type}).toList()'

		args = [
			'buffer',
			element_type + '()',
			lang_field_name(str(self.descriptor.size)),
		]
		if self.descriptor.field_type.sort_key:
			args.append(self._get_sort_accessor())

		args_str = ', '.join(args)

		return f'ArrayHelpers.readArrayCount({args_str}).map((item) => item as {self.descriptor.field_type.element_type}).toList()'

	def advancement_size(self):
		if self.descriptor.field_type.is_byte_constrained:
			return str(self.descriptor.size)

		alignment = self.descriptor.field_type.alignment
		if alignment:
			return f'ArrayHelpers.size({self.name}, {alignment}, {str(not self.descriptor.field_type.is_last_element_padded).lower()})'

		return f'ArrayHelpers.size({self.name})'

	def store(self, field_name, pos):
		if self.is_variable_size:
			buffer_view = 'buffer'
			alignment = self.descriptor.field_type.alignment
			skip_last_element_padding = not self.descriptor.field_type.is_last_element_padded
			return f'ArrayHelpers.writeVariableSizeElements({buffer_view}, {field_name}, {alignment}, {pos}, {str(skip_last_element_padding).lower()})'

		if self.descriptor.field_type.is_expandable:
			return f'ArrayHelpers.writeArray(buffer, {field_name}, {pos})'

		args = ['buffer', field_name, pos]
		size = self.descriptor.size
		if not isinstance(size, str):
			args.append(str(size))
		
		if self.descriptor.field_type.sort_key:
			args.append(self._get_sort_accessor())
			
		args_str = ', '.join(args)
				
		return f'ArrayHelpers.writeArray({args_str})'

	def sort(self, field_name):
		if not self.descriptor.field_type.sort_key:
			return None

		sort_key = lang_field_name(self.descriptor.field_type.sort_key)
		body = ''
		body = f'{field_name}.sort((lhs, rhs) {{\n'
		body += f'\treturn ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.{sort_key}), ArrayHelpers.getValue(rhs.{sort_key}));\n'
		body += f'}})'
		return body

	@staticmethod
	def to_string(field_name):
		return f'${{{field_name}.map((e) => e.toString()).toList()}}'

class ArrayPrinter(Printer):
	def __init__(self, descriptor, name=None):
		super().__init__(descriptor, name)
		self.type_hint = 'bytes_array'

	@staticmethod
	def get_type():
		return 'Uint8List'

	def get_default_value(self):
		size = self.descriptor.size
		if isinstance(size, str):
			return 'Uint8List(0)'

		return f'Uint8List({self.get_size()})'

	def get_size(self):
		size = self.descriptor.size
		if isinstance(size, str):
			return f'{self.name}.lengthInBytes'

		return size

	def load(self, buffer_name='buffer'):
		return f'Uint8List.fromList({buffer_name})'

	def advancement_size(self):
		# like get_size() but without self prefix, as this refers to local method field
		return fix_size_name(self.descriptor.size)

	@staticmethod
	def store(field_name, pos):
		return f'buffer.setRange(currentPos, currentPos + {field_name}.lengthInBytes, {field_name})'

	@staticmethod
	def to_string(field_name):
		return f'${{hex.encode({field_name}.toList()).toUpperCase()}}'

class BuiltinPrinter(Printer):
	def __init__(self, descriptor, name=None):
		super().__init__(descriptor, name)
		self.type_hint = {
			DisplayType.INTEGER: 'pod:',
			DisplayType.BYTE_ARRAY: 'pod:',
			DisplayType.TYPED_ARRAY: 'pod:',
			DisplayType.ENUM: 'enum:',
			DisplayType.STRUCT: 'struct:'
		}[self.descriptor.display_type]

		self.type_hint += self.descriptor.name

	def get_type(self):
		return self.descriptor.name

	def get_default_value(self):
		if DisplayType.ENUM == self.descriptor.display_type:
			first_enum_value_name = self.descriptor.values[0].name
			return f'{self.get_type()}.{first_enum_value_name}'

		return f'{self.get_type()}()'

	def get_size(self):
		return f'{self.name}.size'

	def load(self, buffer_name='buffer'):
		if DisplayType.STRUCT == self.descriptor.display_type and self.descriptor.is_abstract:
			# HACK: factories use this printers as well, ignore them
			if 'parent' != self.name:
				factory_name = self.get_type() + 'Factory'
				return f'{factory_name}().deserialize({buffer_name})'

		return f'{self.get_type()}().deserialize({buffer_name})'

	def advancement_size(self):
		return f'{self.name}.size'

	@staticmethod
	def store(field_name, pos):
		return f'buffer.setRange(currentPos, currentPos + {field_name}.size, {field_name}.serialize())'

	def sort(self, field_name):
		return f'{field_name}.sort()' if DisplayType.STRUCT == self.descriptor.display_type else None
	
	@staticmethod
	def modifier():
		return f'final'

	def assign(self, value):
		# TransactionType(TransactionType.TRANSFER.value);
		return f'{self.get_type()}({self.get_type()}.{value}.value)'

	@staticmethod
	def to_string(field_name):
		return f'{field_name}.toString()'


def create_pod_printer(descriptor, name=None):
	display_type = descriptor.display_type
	if DisplayType.INTEGER == display_type:
		PrinterType = IntPrinter
	elif DisplayType.BYTE_ARRAY == display_type:
		PrinterType = ArrayPrinter
	else:
		PrinterType = TypedArrayPrinter

	return PrinterType(descriptor, name)
