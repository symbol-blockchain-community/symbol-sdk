from .AbstractTypeFormatter import AbstractTypeFormatter, MethodDescriptor
from .printers import IntPrinter
from .format import indent

class EnumTypeFormatter(AbstractTypeFormatter):
	def __init__(self, ast_model):
		super().__init__()

		self.enum_type = ast_model
		self.int_printer = IntPrinter(self.enum_type)

	@property
	def typename(self):
		return self.enum_type.name
	
	def get_bit_size(self):
		if self.enum_type.size == 1:
			return '8'
		elif self.enum_type.size == 2:
			return '16'
		elif self.enum_type.size == 4:
			return '32'
		elif self.enum_type.size == 8:
			return '64'

	def get_fields(self):
		fields = list(
        map(
            lambda e: f'static final {e.name} = {self.typename}({e.value});\n',
            self.enum_type.values,
        )
    )
		fields.append('\n')
		fields.append('final int value;\n')
		fields.append('\n')
		flags = 'static final _flags = {\n'
		flags += indent(''.join(
			map(
					lambda e: f'{e.value}: \'{e.name}\',\n',
					self.enum_type.values,
			)
		))
		flags += '};\n'
		fields.append(flags)
		return fields

	def get_ctor_descriptor(self):
		arguments = ['this.value']
		method_name = f'{self.typename}'
		return MethodDescriptor(method_name=method_name, arguments=arguments)
	
	def get_deserialize_descriptor(self):
		body = 'var byteData = ByteData.sublistView(payload);\n'
		body += f'return {self.enum_type.name}(byteData.getUint{self.get_bit_size()}(0));'
		return MethodDescriptor(body=body)

	def get_serialize_descriptor(self):
		body = f'var byteData = ByteData({self.enum_type.size})..setUint{self.get_bit_size()}(0, value);\n'
		body += f'return byteData.buffer.asUint8List();'
		return MethodDescriptor(body=body)

	def get_size_descriptor(self):
		body = f'return {self.enum_type.size};\n'
		return MethodDescriptor(body=body)
	
	def get_str_descriptor(self):
		body = ''
		#   return 'LinkAction.${LinkAction.valueToKey(this.value)}';
		if not self.enum_type.is_bitwise:
			body = f'return \'{self.typename}.${{_flags[value]}}\';'
			return MethodDescriptor(body=body)

		if any(e.value == 0 for e in self.enum_type.values):
			result = indent('return \'NONE\';')
			body += f'if (value == 0) {{\n{result}}}\n'
		body += '''return _flags.entries
.where((e) => value & e.key != 0)
.map((e) => e.value)
.join(' | ');'''
		return MethodDescriptor(body=body)

