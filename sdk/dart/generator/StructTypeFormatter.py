from itertools import filterfalse

from catparser.DisplayType import DisplayType

from .AbstractTypeFormatter import AbstractTypeFormatter, MethodDescriptor
from .format import indent, uint32_to_int32
from .name_formatting import lang_field_name

def is_reserved(field):
	return 'reserved' == field.disposition

def is_bound_size(field):
	return field.extensions.bound_field is not None

def is_const(field):
	return field.is_const

def is_computed(field):
	return hasattr(field.field_type, 'sizeref') and field.field_type.sizeref

def create_temporary_buffer_name(name):
	return f'{lang_field_name(name)}Condition'

def indent_if_conditional(condition, statements):
	if condition:
		return condition + '{\n' + indent(statements) + '}\n'
	return statements

def filter_size_if_first(fields_iter):
	first_field = next(fields_iter, None)
	if 'size' == first_field.name:
		pass
	else:
		yield first_field

	for field in fields_iter:
		yield field

class StructFormatter(AbstractTypeFormatter):
	# pylint: disable=too-many-public-methods

	def __init__(self, ast_model):
		super().__init__()

		self.struct = ast_model

	def get_base_class(self):
		return None

	def get_interface(self):
		interface = ', ITransaction' if 'Transaction' in self.struct.name and 'Statement' not in self.struct.name else ''
		interface = ', IInnerTransaction' if 'Embedded' in self.struct.name or 'NonVerifiable' in self.struct.name else interface
		return interface
	
	def is_fields_one(self):
		return len(list(self.non_reserved_fields())) == 1

	def non_const_fields(self):
		return filterfalse(is_const, self.struct.fields)

	def const_fields(self):
		return filter(is_const, self.struct.fields)

	def non_reserved_fields(self):
		return filter_size_if_first(filterfalse(is_computed, filterfalse(is_bound_size, filterfalse(is_reserved, self.non_const_fields()))))

	def reserved_fields(self):
		return filter(is_reserved, self.non_const_fields())

	def computed_fields(self):
		return filter(is_computed, self.non_const_fields())
	
	def is_nullable_field(self, field):
		if field.is_conditional:
				conditional = field.value
				condition_field_name = conditional.linked_field_name
				condition_field = next(f for f in self.non_const_fields() if condition_field_name == f.name)
				condition_model = condition_field.extensions.type_model
				if f'{condition_model.name}.{conditional.value}' != condition_field.extensions.printer.get_default_value():
					return True
		return False
	
	@staticmethod
	def re_name(name):
		if 'Transaction' == name:
			return 'ITransaction'
		if 'List<Transaction>' == name:
			return 'List<ITransaction>'
		name = name.replace("NonVerifiable", "IInner")
		name = name.replace("Embedded", "IInner")
		return name

	@property
	def typename(self):
		return self.struct.name

	@staticmethod
	def field_name(field, object_name='this', is_argument=False):
		if is_computed(field):
			# add _computed postfix for easier filtering in bespoke code
			return f'{field.extensions.printer.name}Computed'
		
		if is_argument:
			return field.extensions.printer.name

		return f'{field.extensions.printer.name}'

	@staticmethod
	def generate_class_field(field):
		modifier = field.extensions.printer.modifier()
		default_value = field.extensions.printer.assign(field.value)
		return f'static {modifier} {field.extensions.printer.get_type()} {field.name} = {default_value};'
	
	def generate_field(self):
		body = '\n'
		for field in self.non_reserved_fields():
			const_field = self.get_paired_const_field(field)
			field_name = self.field_name(field)
			class_name = self.re_name(field.extensions.printer.get_type())
			if const_field:
				body += f'{class_name} {field_name} = {self.typename}.{const_field.name};\n'
			else:
				value = field.extensions.printer.get_default_value()
				null = ''
				if field.is_conditional:
					conditional = field.value
					condition_field_name = conditional.linked_field_name
					condition_field = next(f for f in self.non_const_fields() if condition_field_name == f.name)
					condition_model = condition_field.extensions.type_model

					# only initialize default implicit union field in constructor
					if f'{condition_model.name}.{conditional.value}' != condition_field.extensions.printer.get_default_value():
						value = 'null'  # needs to be null or else field will not be destination when copying descriptor properties
						null = '?'
				body += f'{class_name}{null} {field_name} = {value};\n'
				#body += f'this.{field_name} = {arg_name} ?? {value};\n'

		for field in self.reserved_fields():
			field_name = self.field_name(field)
			value = field.value
			body += f'final {field.extensions.printer.get_type()} {field_name} = {value}; // reserved field\n'
		
		return body

	def generate_type_hints(self):
		body = '\n'
		body += 'static const Map<String, String> TYPE_HINTS = {\n'
		hints = []
		for field in self.non_reserved_fields():
			if not field.extensions.printer.type_hint:
				continue

			hints.append(f'\'{field.extensions.printer.name}\': \'{field.extensions.printer.type_hint}\'')

		body += indent(',\n'.join(hints))
		body += '};\n'
		return body

	def get_fields(self):
		return list(map(self.generate_class_field, self.const_fields())) + [self.generate_type_hints()] + [self.generate_field()]

	def get_paired_const_field(self, field):
		for const_field in self.const_fields():
			if const_field.name.lower().endswith(field.name):
				return const_field
		return None

	def get_ctor_descriptor(self):
		args = []
		for field in self.non_reserved_fields():
			field_name = self.field_name(field, is_argument=True)
			args.append(f'{self.re_name(field.extensions.printer.get_type())}? {field_name}') if not self.is_fields_one() else args.append(f'[{field_name}]')
		arguments = args

		body = ''
		for field in self.non_reserved_fields():
			const_field = self.get_paired_const_field(field)
			field_name = self.field_name(field)
			arg_name = self.field_name(field, is_argument=True)
			if const_field:
				body += f'this.{field_name} = {arg_name} ?? {self.typename}.{const_field.name};\n'
			else:
				value = field.extensions.printer.get_default_value()
				if field.is_conditional:
					conditional = field.value
					condition_field_name = conditional.linked_field_name
					condition_field = next(f for f in self.non_const_fields() if condition_field_name == f.name)
					condition_model = condition_field.extensions.type_model

					# only initialize default implicit union field in constructor
					if f'{condition_model.name}.{conditional.value}' != condition_field.extensions.printer.get_default_value():
						value = 'null'  # needs to be null or else field will not be destination when copying descriptor properties

				body += f'this.{field_name} = {arg_name} ?? {value};\n'

		if not body:
			return 'null'

		return MethodDescriptor(body=body, arguments=arguments)#, super=super)

	def get_comparer_descriptor(self):
		if not self.struct.comparer:
			return None

		body = 'return Tuple2(\n'
		for (property_name, transform) in self.struct.comparer:
			body += '\t'
			property_name = lang_field_name(property_name)
			if not transform:
				# modificationType is Enum ? modificationType.value : modificationType,
				body += f'{property_name}.value'
			else:
				body += f'{lang_field_name(transform).replace("_", "")}({property_name}.bytes)'

			body += ',\n'

		body += ');'

		return MethodDescriptor(body=body)

	def generate_condition(self, field, prefix_field=False):
		if not field.is_conditional:
			return ''

		conditional = field.value
		condition_field_name = conditional.linked_field_name

		# find condition field type
		condition_field = next(f for f in self.non_const_fields() if condition_field_name == f.name)
		condition_to_operator_map = {
			'equals': '==',
			'not equals': '!=',
			'not in': 'not in',
			'in': 'in',
		}
		condition_operator = condition_to_operator_map[conditional.operation]

		value = f'{conditional.value if not isinstance(conditional.value, int) else uint32_to_int32(conditional.value)}'
		condition_model = condition_field.extensions.type_model
		yoda_value = value if DisplayType.INTEGER == condition_model.display_type else f'{condition_model.name}.{value}.value'
		#field_prefix = '_' if prefix_field else ''
		field_prefix = ''

		# HACK: instead of handling dumb magic value in namespace parent_name, generate slightly simpler condition
		if prefix_field and DisplayType.UNSET != field.display_type:
			return f'if ({lang_field_name(field.name)} != null)\n'

		field_postfix = 'Computed' if prefix_field and is_computed(condition_field) else '' if DisplayType.INTEGER == condition_model.display_type else '.value'
		field_prefix = '' if field_prefix and is_computed(condition_field) else field_prefix

		return f'if ({yoda_value} {condition_operator} {field_prefix}{lang_field_name(condition_field_name)}{field_postfix})\n'

	def get_sort_descriptor(self):
		body = ''
		is_last_sort_field_conditional = False
		for field in self.non_const_fields():
			field_value = self.field_name(field)

			if self.is_nullable_field(field):
				field_value += '?'
			sort = field.extensions.printer.sort(field_value)
			if not sort:
				continue

			condition = self.generate_condition(field, True)

			if is_computed(field):
				sort += 'Computed'

			body += indent_if_conditional(condition, f'{sort};\n')

		if is_last_sort_field_conditional:
			body = body[:-1]

		if body == '':
			body = '// empty body'

		return MethodDescriptor(body=body)

	def generate_deserialize_field(self, field, arg_buffer_name=None):
		condition = self.generate_condition(field)

		buffer_name = arg_buffer_name or 'buffer'
		field_name = field.extensions.printer.name
		field_name_ = field_name if condition else 'var ' + field_name

		# half-hack: limit buffer to amount specified in size field
		buffer_load_name = buffer_name
		size_fields = field.extensions.size_fields
		if size_fields:
			assert len(size_fields) == 1, f'unexpected number of size_fields associated with {field.name}'
			buffer_load_name = 'buffer'

		adjust = ''
		field_size = field.extensions.printer.advancement_size()
		if field.display_type == DisplayType.TYPED_ARRAY:
			load = f'{field.extensions.printer.load(buffer_load_name)}'
			adjust += f'{buffer_name} = {buffer_name}.sublist({lang_field_name(field_size)});\n'
		else:
			field_size = field.extensions.printer.advancement_size()
			if field.display_type == DisplayType.INTEGER:
				buffer_load_name = 'buffer'
			elif field.display_type == DisplayType.BYTE_ARRAY:
				buffer_load_name = f'buffer.sublist(0, {lang_field_name(field.size)})'
				field_size = lang_field_name(field.size)
			load = field.extensions.printer.load(buffer_load_name)
			if self.struct.size == field.extensions.printer.name:
				adjust += f'{buffer_name} = {buffer_name}.sublist(0, size);\n'	
			adjust += f'{buffer_name} = {buffer_name}.sublist({field_size});\n'
		deserialize = f'{field_name_} = {load};'
		#deserialize = f'{load};' if field_name == 'size' else f'{field_name_} = {load};'

		additional_statements = ''
		if is_reserved(field):
			assert_message = f'throw RangeError(\'Invalid value of reserved field (${field.extensions.printer.name})\');'
			additional_statements = f'if ({field.value} != {field.extensions.printer.name}) {{\n\t{assert_message}\n}}\n'

		if is_bound_size(field) and field.is_size_reference:
			additional_statements += '//marking sizeof field\n'

		deserialize_field = deserialize + '\n' + adjust + additional_statements

		value = '0' if field.extensions.printer.get_type() == 'Uint8List' else ''
		if condition:
			condition = f'var {field.extensions.printer.name} = {field.extensions.printer.get_type()}({value});\n' + condition

		return indent_if_conditional(condition, deserialize_field)

	def get_deserialize_descriptor(self):
		body = 'var buffer = payload;\n'

		# special treatment for condition-guarded fields,
		# where condition is behind the fields...
		processed_fields = set()
		queued_fields = {}
		for field in self.non_const_fields():
			if field.is_conditional:
				conditional = field.value
				condition_field_name = conditional.linked_field_name

				if condition_field_name not in processed_fields:
					if condition_field_name not in queued_fields:
						queued_fields[condition_field_name] = []

						# assume same size and generate single dummy access
						comment = '// deserialize to temporary buffer for further processing'
						deserialize = f'var {field.extensions.printer.name}Temporary = {field.extensions.printer.load()};'
						temporary_buffer = create_temporary_buffer_name(condition_field_name)
						temporary = f'var {temporary_buffer} = buffer.sublist(0, {field.extensions.printer.name}Temporary.size);'
						adjust = f'buffer = buffer.sublist({field.extensions.printer.name}Temporary.size);'
						body += comment + '\n' + deserialize + '\n' + temporary + '\n' + adjust + '\n\n'

					# queue field for re-reading it from temporary buffer
					queued_fields[condition_field_name].append({'field': field})
					continue

			deserialized_field = self.generate_deserialize_field(field)
			body += deserialized_field
			processed_fields.add(field.name)

			# if conditional field has been processed, process queued fields
			for conditioned in queued_fields.get(field.name, []):
				body += self.generate_deserialize_field(
					conditioned['field'],
					create_temporary_buffer_name(field.name),
				)

		# create call to ctor
		body += '\n'
		body += f'var instance = {self.typename}('

		if not self.is_fields_one():
			body += '\n'

		for field in self.non_reserved_fields():
			field_name = self.field_name(field, 'instance', True)
			body += f'{field_name}' if self.is_fields_one() else f'\t{field_name}: {field_name},\n'

		body += ');\n'
		body += 'return instance;'
		return MethodDescriptor(body=body)

	def generate_serialize_field(self, field):
		condition = self.generate_condition(field, True)

		field_value = ''
		field_comment = ''

		# bound fields are the size / count / sizeof fields that are bound to either object or array
		bound_field = field.extensions.bound_field
		if is_bound_size(field):
			bound_field_name = self.field_name(bound_field)
			field_comment = f'  # {field.name}'

			if bound_field.display_type.is_array:
				if field.name.endswith('_count') or not bound_field.field_type.is_byte_constrained:
					field_value = f'{bound_field_name}.length'

					bound_condition = self.generate_condition(bound_field, True)
					if condition and bound_condition:
						raise RuntimeError('do not know yet how to generate both conditions')

					# HACK: create inline if condition (for NEM namespace purposes)
					if bound_condition:
						condition_value = bound_field.value.value
						field_value = f'({bound_field_name} != null ? {field_value.replace(".", "!.")} : {condition_value})'
				else:
					field_value = bound_field.extensions.printer.get_size()
			elif field.is_size_reference:
				field_value = bound_field.extensions.printer.get_size()
		else:
			field_value = self.field_name(field)

		adjust = ''
		serialize_field = f'{field.extensions.printer.store(field_value, "currentPos")}'
		if field.display_type == DisplayType.TYPED_ARRAY:

			serialize_field = f'sort();\nvar res_{field.extensions.printer.name} = {serialize_field}'
			adjust = f'currentPos = res_{field_value}.item2;\n'
			adjust += f'buffer = res_{field_value}.item1;\n'
		else:
			size = field.extensions.printer.get_size()
			adjust = f'currentPos += {size};\n'
			if self.is_nullable_field(field):
				adjust = f'currentPos += {size.replace(".", "!.")};\n'
				serialize_field = f'{field.extensions.printer.store(field_value + "!", "currentPos")}'
			
		return indent_if_conditional(condition, f'{serialize_field};\n{adjust}')

	def get_computed_name(self, field):
		conditional = field.value
		condition_field_name = conditional.linked_field_name
		condition_field = next(f for f in self.non_const_fields() if condition_field_name == f.name)
		condition_model = condition_field.extensions.type_model

		if f'{condition_model.name}.{conditional.value}' != condition_field.extensions.printer.get_default_value():
			condition_field_name = lang_field_name(conditional.linked_field_name)
			return f'{condition_field_name}Computed' if is_computed(condition_field) else ''

	def get_serialize_descriptor(self):
		body = 'var buffer = Uint8List(size);\n'
		body += 'var currentPos = 0;\n'

		# if first field is size replace serializer with custom one (to access builder .size() instead)
		fields_iter = self.non_const_fields()
		first_field = next(fields_iter)
		if self.struct.size == first_field.extensions.printer.name:
			body += f'buffer.setRange(currentPos, currentPos + {first_field.size}, intToBytes(size, {first_field.size}));\n'
			body += f'currentPos += {first_field.size};\n'
		else:
			body += self.generate_serialize_field(first_field)

		for field in fields_iter:
			body += self.generate_serialize_field(field)

		body += 'return buffer.buffer.asUint8List();'
		return MethodDescriptor(body=body)

	def generate_size_field(self, field):
		condition = self.generate_condition(field, True)
		size_field = field.extensions.printer.get_size()
		if self.is_nullable_field(field):
			size_field = size_field.replace(".", "!.")

		return indent_if_conditional(condition, f'size += {size_field};\n')

	def get_size_descriptor(self):
		body = 'var size = 0;\n'
		body += ''.join(map(self.generate_size_field, self.non_const_fields()))
		body += 'return size;'
		return MethodDescriptor(body=body)
	
	def create_getter_descriptor(self, field):
		method_name = 'get ' + field.extensions.printer.name
		body = f'return {self.field_name(field)};'
		if is_computed(field):
			method_name += 'Computed'
			body = f'return {field.field_type.sizeref.property_name}?.size ?? 0;'

		method_descriptor = MethodDescriptor(method_name=method_name, body=body, result=self.re_name(field.extensions.printer.get_type()))
		return method_descriptor

	def get_getter_descriptors(self):
		return list(map(self.create_getter_descriptor, self.computed_fields()))

	def create_setter_descriptor(self, field):
		method_descriptor = MethodDescriptor(
			method_name= 'set ' + field.extensions.printer.name,
			arguments=[f'{self.re_name(field.extensions.printer.get_type())} value'],
			body=f'{self.field_name(field)} = value;',
		)
		return method_descriptor

	def generate_str_field(self, field):
		condition = self.generate_condition(field, True)
		if field.display_type == DisplayType.INTEGER:
			field_to_string = field.extensions.printer.to_string(self.field_name(field), field.size)
		else:
			if self.is_nullable_field(field):
				field_to_string = field.extensions.printer.to_string(self.field_name(field) + "!")
			else:
				field_to_string = field.extensions.printer.to_string(self.field_name(field))
		field_to_string = field_to_string if '{' in field_to_string else f'${{{field_to_string}}}'
		return indent_if_conditional(condition, f'result += \'{field.extensions.printer.name}: "{field_to_string}", \';\n')

	def get_str_descriptor(self):
		body = f'var result = \'{self.typename}(\';\n'
		body += ''.join(map(self.generate_str_field, self.non_reserved_fields()))
		body += 'result += \')\';\n'
		body += 'return result;'
		return MethodDescriptor(body=body)
