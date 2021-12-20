import unittest

from catparser.ast import (Alias, Array, AstException, Attribute, Comment, Conditional, Enum, EnumValue, FixedSizeBuffer, FixedSizeInteger,
                           Struct, StructField, StructInlinePlaceholder)

# region Comment


class CommentTests(unittest.TestCase):
    def test_can_parse_single_line_comment(self):
        # Act:
        model = Comment('# this is a comment')

        # Assert:
        self.assertEqual('this is a comment', model.parsed)
        self.assertEqual('this is a comment', str(model))

    def test_can_parse_multi_line_comment(self):
        # Act:
        model = Comment('\n'.join([
            '# this is a comment',
            '# foo bar'
        ]))

        # Assert:
        self.assertEqual('this is a comment foo bar', model.parsed)
        self.assertEqual('this is a comment foo bar', str(model))

    def test_can_parse_multi_line_comment_with_indentation(self):
        # Act:
        model = Comment('\n'.join([
            '# this is a comment',
            '\t# foo bar'
        ]))

        # Assert:
        self.assertEqual('this is a comment foo bar', model.parsed)
        self.assertEqual('this is a comment foo bar', str(model))

    def test_can_parse_multi_line_comment_with_newlines(self):
        # Act:
        model = Comment('\n'.join([
            '# this is a comment',
            '#',
            '# baz',
            '#',
            '# foo bar'
        ]))

        # Assert:
        self.assertEqual('this is a comment\nbaz\nfoo bar', model.parsed)
        self.assertEqual('this is a comment\nbaz\nfoo bar', str(model))

    def test_post_processing_removes_leading_and_trailing_whitespace_per_line_with_newlines(self):
        # Act:
        model = Comment('\n'.join([
            '#    this is a comment   ',
            '#            ',
            '#        baz    ',
            '#     ',
            '#      foo   bar   '
        ]))

        # Assert:
        self.assertEqual('this is a comment\nbaz\nfoo   bar', model.parsed)
        self.assertEqual('this is a comment\nbaz\nfoo   bar', str(model))


# endregion

# region FixedSizeInteger / FixedSizeBuffer

class FixedSizeIntegerTests(unittest.TestCase):
    def test_can_create_unsigned_value(self):
        # Act:
        model = FixedSizeInteger('uint16')

        # Assert:
        self.assertEqual('uint16', model.short_name)
        self.assertEqual(True, model.is_unsigned)
        self.assertEqual(2, model.size)
        self.assertEqual('unsigned', model.signedness)
        self.assertEqual({'size': 2, 'type': 'byte', 'signedness': 'unsigned'}, model.to_legacy_descriptor())
        self.assertEqual('uint16', str(model))

    def test_can_create_signed_value(self):
        # Act:
        model = FixedSizeInteger('int32')

        # Assert:
        self.assertEqual('int32', model.short_name)
        self.assertEqual(False, model.is_unsigned)
        self.assertEqual(4, model.size)
        self.assertEqual('signed', model.signedness)
        self.assertEqual({'size': 4, 'type': 'byte', 'signedness': 'signed'}, model.to_legacy_descriptor())
        self.assertEqual('int32', str(model))


class FixedSizeBufferTests(unittest.TestCase):
    def test_can_create_buffer(self):
        # Act:
        model = FixedSizeBuffer(17)

        # Assert:
        self.assertEqual(17, model.size)
        self.assertEqual({'size': 17, 'type': 'byte', 'signedness': 'unsigned'}, model.to_legacy_descriptor())
        self.assertEqual('binary_fixed(17)', str(model))


# endregion

# region Alias

class AliasTests(unittest.TestCase):
    def _test_can_create_alias(self, comment, expected_comment_descriptor):
        # Act:
        model = Alias(['FooBar', FixedSizeInteger('uint16')])
        model.comment = comment

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual('uint16', model.linked_type.short_name)
        self.assertEqual(comment, model.comment)
        self.assertEqual({
            **expected_comment_descriptor, 'name': 'FooBar', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'
        }, model.to_legacy_descriptor())
        self.assertEqual('using FooBar = uint16', str(model))

    def test_can_create_alias(self):
        self._test_can_create_alias(None, {})

    def test_can_create_alias_with_comment(self):
        self._test_can_create_alias(Comment('# my amazing comment'), {'comments': 'my amazing comment'})


# endregion

# region Enum

class EnumTests(unittest.TestCase):
    def _test_can_create_enum(self, comment, expected_comment_descriptor):
        # Act:
        model = Enum(['ColorShade', FixedSizeInteger('uint32'), EnumValue(['RED', 0xFF0000]), EnumValue(['GREEN', 0x00FF00])])
        model.comment = comment

        # Assert:
        self.assertEqual('ColorShade', model.name)
        self.assertEqual('uint32', model.base.short_name)
        self.assertEqual([('RED', 0xFF0000), ('GREEN', 0x00FF00)], [(enum_value.name, enum_value.value) for enum_value in model.values])
        self.assertEqual({
            **expected_comment_descriptor,
            'name': 'ColorShade',
            'type': 'enum',
            'size': 4,
            'signedness': 'unsigned',
            'values': [{'name': 'RED', 'value': 0xFF0000}, {'name': 'GREEN', 'value': 0x00FF00}]
        }, model.to_legacy_descriptor())
        self.assertEqual('enum ColorShade : uint32  # 2 value(s)', str(model))

    def test_can_create_enum(self):
        self._test_can_create_enum(None, {})

    def test_can_create_enum_with_comment(self):
        self._test_can_create_enum(Comment('# my amazing comment'), {'comments': 'my amazing comment'})


class EnumValueTests(unittest.TestCase):
    def _test_can_create_enum_value(self, comment, expected_comment_descriptor):
        # Act:
        model = EnumValue(['AZUL', 123])
        model.comment = comment

        # Assert:
        self.assertEqual('AZUL', model.name)
        self.assertEqual(123, model.value)
        self.assertEqual(comment, model.comment)
        self.assertEqual({**expected_comment_descriptor, 'name': 'AZUL', 'value': 123}, model.to_legacy_descriptor())
        self.assertEqual('AZUL = 123', str(model))

    def test_can_create_enum_value(self):
        self._test_can_create_enum_value(None, {})

    def test_can_create_enum_value_with_comment(self):
        self._test_can_create_enum_value(Comment('# my amazing comment'), {'comments': 'my amazing comment'})


# endregion

# region Attribute

class AttributeTests(unittest.TestCase):
    def test_can_create_attribute_without_value(self):
        # Act:
        model = Attribute(['foo'])

        # Assert:
        self.assertEqual('foo', model.name)
        self.assertEqual(True, model.is_flag)
        self.assertEqual(True, model.value)
        self.assertEqual([], model.values)
        self.assertEqual('@foo', str(model))

    def test_can_create_attribute_with_single_value(self):
        # Act:
        model = Attribute(['foo', 'something'])

        # Assert:
        self.assertEqual('foo', model.name)
        self.assertEqual(False, model.is_flag)
        self.assertEqual('something', model.value)
        self.assertEqual(['something'], model.values)
        self.assertEqual('@foo(something)', str(model))

    def test_can_create_attribute_with_multiple_values(self):
        # Act:
        model = Attribute(['foo', 'something', 'else', 'there'])

        # Assert:
        self.assertEqual('foo', model.name)
        self.assertEqual(False, model.is_flag)
        self.assertEqual('something', model.value)
        self.assertEqual(['something', 'else', 'there'], model.values)
        self.assertEqual('@foo(something, else, there)', str(model))


# endregion

# region Struct

class StructTests(unittest.TestCase):
    def _assert_disposition(self, model, disposition=None, is_inline=False):
        self.assertEqual(disposition, model.disposition)
        self.assertEqual(is_inline, model.is_inline)

    def _assert_attributes(self, model, size=None, discriminator=None, initializers=None):
        self.assertEqual(size, model.size)
        self.assertEqual(discriminator, model.discriminator)
        self.assertEqual([] if initializers is None else initializers, model.initializers)

    def _test_can_create_struct(self, comment, expected_comment_descriptor):
        # Act:
        model = Struct([None, 'FooBar', StructField(['alpha', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        model.comment = comment

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['alpha', 'beta'], [field.name for field in model.fields])
        self._assert_disposition(model)
        self._assert_attributes(model)
        self.assertEqual({
            **expected_comment_descriptor,
            'name': 'FooBar',
            'type': 'struct',
            'layout': [{'name': 'alpha', 'type': 'MyCustomType'}, {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'}]
        }, model.to_legacy_descriptor())
        self.assertEqual('struct FooBar  # 2 field(s)', str(model))

    def _test_can_create_struct_with_modifier(self, comment, expected_comment_descriptor, disposition, is_inline=False):
        # Act:
        model = Struct([disposition, 'FooBar', StructField(['alpha', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        model.comment = comment

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['alpha', 'beta'], [field.name for field in model.fields])
        self._assert_disposition(model, disposition=disposition, is_inline=is_inline)
        self._assert_attributes(model)
        self.assertEqual({
            **expected_comment_descriptor,
            'name': 'FooBar',
            'type': 'struct',
            'layout': [{'name': 'alpha', 'type': 'MyCustomType'}, {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'}],
            'disposition': disposition
        }, model.to_legacy_descriptor())
        self.assertEqual(f'{disposition} struct FooBar  # 2 field(s)', str(model))

    def test_can_create_struct(self):
        self._test_can_create_struct(None, {})

    def test_can_create_struct_with_comment(self):
        self._test_can_create_struct(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def test_can_create_inline_struct(self):
        self._test_can_create_struct_with_modifier(None, {}, 'inline', True)

    def test_can_create_inline_struct_with_comment(self):
        self._test_can_create_struct_with_modifier(Comment('# my amazing comment'), {'comments': 'my amazing comment'}, 'inline', True)

    def test_can_create_const_struct(self):
        self._test_can_create_struct_with_modifier(None, {}, 'const')

    def test_can_create_const_struct_with_comment(self):
        self._test_can_create_struct_with_modifier(Comment('# my amazing comment'), {'comments': 'my amazing comment'}, 'const')

    def test_can_create_struct_with_factory_type(self):
        # Act:
        model = Struct([None, 'FooBar', StructField(['alpha', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        model.factory_type = 'Dust'

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['alpha', 'beta'], [field.name for field in model.fields])
        self._assert_disposition(model)
        self._assert_attributes(model)
        self.assertEqual({
            'name': 'FooBar',
            'type': 'struct',
            'layout': [{'name': 'alpha', 'type': 'MyCustomType'}, {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'}],
            'factory_type': 'Dust'
        }, model.to_legacy_descriptor())
        self.assertEqual('struct FooBar  # 2 field(s)', str(model))

    def test_can_create_struct_with_attribute_size(self):
        # Act:
        model = Struct([None, 'FooBar', StructField(['alpha', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        model.attributes = [Attribute(['size', 'alpha'])]

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['alpha', 'beta'], [field.name for field in model.fields])
        self._assert_disposition(model)
        self._assert_attributes(model, size='alpha')
        self.assertEqual({
            'name': 'FooBar',
            'type': 'struct',
            'layout': [{'name': 'alpha', 'type': 'MyCustomType'}, {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'}],
            'size': 'alpha'
        }, model.to_legacy_descriptor())
        self.assertEqual('@size(alpha)\nstruct FooBar  # 2 field(s)', str(model))

    def test_can_create_struct_with_attribute_discriminator(self):
        # Act:
        model = Struct([None, 'FooBar', StructField(['alpha', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        model.attributes = [Attribute(['discriminator', 'beta'])]

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['alpha', 'beta'], [field.name for field in model.fields])
        self._assert_disposition(model)
        self._assert_attributes(model, discriminator='beta')
        self.assertEqual({
            'name': 'FooBar',
            'type': 'struct',
            'layout': [{'name': 'alpha', 'type': 'MyCustomType'}, {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'}],
            'discriminator': 'beta'
        }, model.to_legacy_descriptor())
        self.assertEqual('@discriminator(beta)\nstruct FooBar  # 2 field(s)', str(model))

    def test_can_create_struct_with_attribute_initializes(self):
        # Act:
        model = Struct([
            None,
            'FooBar',
            StructField(['ALPHAQ', FixedSizeInteger('int32'), 123], 'const'),
            StructField(['alpha', FixedSizeInteger('int32')]),
            StructField(['beta', FixedSizeInteger('uint16')]),
            StructField(['BETAZ', FixedSizeInteger('uint16'), 222], 'const'),
        ])
        model.attributes = [Attribute(['initializes', 'alpha', 'ALPHAQ']), Attribute(['initializes', 'beta', 'BETAZ'])]

        # Assert:
        self.assertEqual('FooBar', model.name)
        self.assertEqual(['ALPHAQ', 'alpha', 'beta', 'BETAZ'], [field.name for field in model.fields])
        self._assert_disposition(model)
        self._assert_attributes(model, initializers=[Struct.Initializer('alpha', 'ALPHAQ'), Struct.Initializer('beta', 'BETAZ')])
        self.assertEqual({
            'name': 'FooBar',
            'type': 'struct',
            'layout': [
                {'name': 'ALPHAQ', 'size': 4, 'type': 'byte', 'signedness': 'signed', 'value': 123, 'disposition': 'const'},
                {'name': 'alpha', 'size': 4, 'type': 'byte', 'signedness': 'signed'},
                {'name': 'beta', 'size': 2, 'type': 'byte', 'signedness': 'unsigned'},
                {'name': 'BETAZ', 'size': 2, 'type': 'byte', 'signedness': 'unsigned', 'value': 222, 'disposition': 'const'}
            ],
            'initializers': [
                {'target_property_name': 'alpha', 'value': 'ALPHAQ'},
                {'target_property_name': 'beta', 'value': 'BETAZ'},
            ]
        }, model.to_legacy_descriptor())
        self.assertEqual('@initializes(alpha, ALPHAQ)\n@initializes(beta, BETAZ)\nstruct FooBar  # 4 field(s)', str(model))

    def test_cannot_apply_inline_template_when_struct_is_not_inline(self):
        # Arrange:
        model = Struct([None, 'FooBar', StructField(['__value__', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        named_inline_field = StructField(['foo', 'FooBar'], 'inline')

        # Act:
        with self.assertRaises(AstException):
            model.apply_inline_template(named_inline_field)

    def test_can_apply_inline_template_without_comments(self):
        # Arrange:
        model = Struct(['inline', 'FooBar', StructField(['__value__', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        named_inline_field = StructField(['foo', 'FooBar'], 'inline')

        # Act:
        fields = model.apply_inline_template(named_inline_field)

        # Assert:
        self.assertEqual(2, len(fields))

        self.assertEqual('foo', fields[0].name)
        self.assertEqual('MyCustomType', fields[0].field_type)

        self.assertEqual('foo_beta', fields[1].name)
        self.assertEqual('uint16', fields[1].field_type.short_name)

        for field in fields:
            self.assertEqual(None, field.value)
            self.assertEqual(None, field.disposition)
            self.assertEqual(None, field.comment)

    def test_can_apply_inline_template_with_comments(self):
        # Arrange:
        model = Struct(['inline', 'FooBar', StructField(['__value__', 'MyCustomType']), StructField(['beta', FixedSizeInteger('uint16')])])
        named_inline_field = StructField(['foo', 'FooBar'], 'inline')
        named_inline_field.comment = Comment('\n'.join([
            '# ignored text',
            '#',
            '# [__value__]',
            '# something cool',
            '#',
            '# something else cool',
            '#',
            '# [beta]',
            '# size of something',
        ]))

        # Act:
        fields = model.apply_inline_template(named_inline_field)

        # Assert:
        self.assertEqual(2, len(fields))

        self.assertEqual('foo', fields[0].name)
        self.assertEqual('MyCustomType', fields[0].field_type)
        self.assertEqual('something cool\nsomething else cool', fields[0].comment.parsed)

        self.assertEqual('foo_beta', fields[1].name)
        self.assertEqual('uint16', fields[1].field_type.short_name)
        self.assertEqual('size of something', fields[1].comment.parsed)

        for field in fields:
            self.assertEqual(None, field.value)
            self.assertEqual(None, field.disposition)


class StructFieldTests(unittest.TestCase):
    def _assert_extensions(self, model, comment=None, attributes=None):
        self.assertEqual(comment, model.comment)
        self.assertEqual(attributes, model.attributes)

    def _test_can_create_struct_field(self, comment, expected_comment_descriptor):
        # Act:
        model = StructField(['foo_field', 'MyCustomType'])
        model.comment = comment

        # Assert:
        self.assertEqual('foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model, comment=comment)

        self.assertEqual({**expected_comment_descriptor, 'name': 'foo_field', 'type': 'MyCustomType'}, model.to_legacy_descriptor())
        self.assertEqual('foo_field = MyCustomType', str(model))

    def test_can_create_struct_field(self):
        self._test_can_create_struct_field(None, {})

    def test_can_create_struct_field_with_comment(self):
        self._test_can_create_struct_field(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def test_can_create_conditional_struct_field(self):
        # Act:
        model = StructField(['foo_field', 'MyCustomType', Conditional(['SPECIAL_FLAG', 'not in', 'custom_flags'])])

        # Assert:
        self.assertEqual('foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual('custom_flags', model.value.linked_field_name)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model)

        self.assertEqual({
            'name': 'foo_field', 'type': 'MyCustomType',
            'condition': 'custom_flags', 'condition_operation': 'not in', 'condition_value': 'SPECIAL_FLAG'
        }, model.to_legacy_descriptor())
        self.assertEqual('foo_field = MyCustomType if SPECIAL_FLAG not in custom_flags', str(model))

    def _test_can_create_inline_struct_field(self, comment, expected_comment_descriptor):
        # Act:
        model = StructField(['foo_field', 'MyCustomType'], 'inline')
        model.comment = comment

        # Assert:
        self.assertEqual('foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual('inline', model.disposition)
        self._assert_extensions(model, comment=comment)

        self.assertEqual(
            {**expected_comment_descriptor, 'name': 'foo_field', 'type': 'MyCustomType', 'disposition': 'inline'},
            model.to_legacy_descriptor())
        self.assertEqual('foo_field = inline MyCustomType', str(model))

    def test_can_create_inline_struct_field(self):
        self._test_can_create_inline_struct_field(None, {})

    def test_can_create_inline_struct_field_with_comment(self):
        self._test_can_create_inline_struct_field(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def _test_can_create_const_struct_field(self, comment, expected_comment_descriptor):
        # Act:
        model = StructField(['BACKGROUND_COLOR', 'ColorShade', 'RED'], 'const')
        model.comment = comment

        # Assert:
        self.assertEqual('BACKGROUND_COLOR', model.name)
        self.assertEqual('ColorShade', model.field_type)
        self.assertEqual('RED', model.value)
        self.assertEqual('const', model.disposition)
        self._assert_extensions(model, comment=comment)

        self.assertEqual(
            {**expected_comment_descriptor, 'name': 'BACKGROUND_COLOR', 'type': 'ColorShade', 'value': 'RED', 'disposition': 'const'},
            model.to_legacy_descriptor())
        self.assertEqual('BACKGROUND_COLOR = make_const(ColorShade, RED)', str(model))

    def test_can_create_const_struct_field(self):
        self._test_can_create_const_struct_field(None, {})

    def test_can_create_const_struct_field_with_comment(self):
        self._test_can_create_const_struct_field(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def _test_can_create_reserved_struct_field(self, comment, expected_comment_descriptor):
        # Act:
        model = StructField(['background_color', 'ColorShade', 'RED'], 'reserved')
        model.comment = comment

        # Assert:
        self.assertEqual('background_color', model.name)
        self.assertEqual('ColorShade', model.field_type)
        self.assertEqual('RED', model.value)
        self.assertEqual('reserved', model.disposition)
        self._assert_extensions(model, comment=comment)

        self.assertEqual(
            {**expected_comment_descriptor, 'name': 'background_color', 'type': 'ColorShade', 'value': 'RED', 'disposition': 'reserved'},
            model.to_legacy_descriptor())
        self.assertEqual('background_color = make_reserved(ColorShade, RED)', str(model))

    def test_can_create_reserved_struct_field(self):
        self._test_can_create_reserved_struct_field(None, {})

    def test_can_create_reserved_struct_field_with_comment(self):
        self._test_can_create_reserved_struct_field(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def _test_can_create_const_reserved_struct_field_with_zero_value(self, field_name, disposition):
        # Act:
        model = StructField([field_name, FixedSizeInteger('uint8'), 0], disposition)

        # Assert:
        self.assertEqual(field_name, model.name)
        self.assertEqual('uint8', model.field_type.short_name)
        self.assertEqual(0, model.value)
        self.assertEqual(disposition, model.disposition)
        self._assert_extensions(model)

        self.assertEqual(
            {'name': field_name, 'type': 'byte', 'size': 1, 'signedness': 'unsigned', 'value': 0, 'disposition': disposition},
            model.to_legacy_descriptor())
        self.assertEqual(f'{field_name} = make_{disposition}(uint8, 0)', str(model))

    def test_can_create_const_struct_field_with_zero_value(self):
        self._test_can_create_const_reserved_struct_field_with_zero_value('CONST_1', 'const')

    def test_can_create_reserved_struct_field_with_zero_value(self):
        self._test_can_create_const_reserved_struct_field_with_zero_value('reserved_1', 'reserved')

    def _test_can_create_sizeof_struct_field(self, comment, expected_comment_descriptor):
        # Act:
        model = StructField(['background_color_size', FixedSizeInteger('uint16'), 'other_property'], 'sizeof')
        model.comment = comment

        # Assert:
        self.assertEqual('background_color_size', model.name)
        self.assertEqual('uint16', model.field_type.short_name)
        self.assertEqual('other_property', model.value)
        self.assertEqual('sizeof', model.disposition)
        self._assert_extensions(model, comment=comment)

        self.assertEqual({
            **expected_comment_descriptor,
            'name': 'background_color_size',
            'type': 'byte',
            'size': 2,
            'signedness': 'unsigned',
            'value': 'other_property',
            'disposition': 'sizeof'
        }, model.to_legacy_descriptor())
        self.assertEqual('background_color_size = sizeof(uint16, other_property)', str(model))

    def test_can_create_sizeof_struct_field(self):
        self._test_can_create_sizeof_struct_field(None, {})

    def test_can_create_sizeof_struct_field_with_comment(self):
        self._test_can_create_sizeof_struct_field(Comment('# my amazing comment'), {'comments': 'my amazing comment'})

    def test_can_create_struct_field_with_attributes(self):
        # Act:
        attributes = [Attribute(['foo', 'alpha']), Attribute(['bar']), Attribute(['baz', 'beta'])]
        model = StructField(['foo_field', 'MyCustomType'])
        model.attributes = attributes

        # Assert:
        self.assertEqual('foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model, attributes=attributes)

        self.assertEqual({'name': 'foo_field', 'type': 'MyCustomType'}, model.to_legacy_descriptor())
        self.assertEqual('@foo(alpha)\n@bar\n@baz(beta)\nfoo_field = MyCustomType', str(model))

    def test_can_copy_simple_field(self):
        # Arrange:
        model = StructField(['foo_field', 'MyCustomType'])

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model)

    def test_can_copy_field_with_special_name(self):
        # Arrange:
        model = StructField(['__value__', 'MyCustomType'])

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model)

    def test_can_copy_field_with_value(self):
        # Arrange:
        model = StructField(['foo_field', FixedSizeInteger('uint8'), 10], 'reserved')

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_foo_field', model.name)
        self.assertEqual('uint8', model.field_type.short_name)
        self.assertEqual(10, model.value)
        self.assertEqual('reserved', model.disposition)
        self._assert_extensions(model)

    def test_can_copy_field_with_array_type(self):
        # Arrange:
        model = StructField(['foo_field', Array(['ElementType', 'bar_field'])])
        model.field_type.sort_key = 'foo_field'

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_foo_field', model.name)

        self.assertEqual('alpha_bar_field', model.field_type.size)
        self.assertEqual('array', model.field_type.disposition)
        self.assertEqual('ElementType', model.field_type.element_type)
        self.assertEqual('alpha_foo_field', model.field_type.sort_key)

        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model)

    def test_can_copy_field_with_conditional_value(self):
        # Arrange:
        model = StructField(['foo_field', 'MyCustomType', Conditional(['SPECIAL_FLAG', 'not in', 'custom_flags'])])

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)

        self.assertEqual('alpha_custom_flags', model.value.linked_field_name)
        self.assertEqual('not in', model.value.operation)
        self.assertEqual('SPECIAL_FLAG', model.value.value)

        self.assertEqual(None, model.disposition)
        self._assert_extensions(model)

    def test_can_copy_simple_field_with_attributes(self):
        # Arrange:
        attributes = [Attribute(['foo', 'alpha'])]
        model = StructField(['foo_field', 'MyCustomType'])
        model.attributes = attributes

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_foo_field', model.name)
        self.assertEqual('MyCustomType', model.field_type)
        self.assertEqual(None, model.value)
        self.assertEqual(None, model.disposition)
        self._assert_extensions(model, attributes=attributes)


class StructInlinePlaceholderTests(unittest.TestCase):
    def _test_can_create_struct_inline_placeholder(self, comment, expected_comment_descriptor):
        # Act:
        model = StructInlinePlaceholder(['MyCustomType'])
        model.comment = comment

        # Assert:
        self.assertEqual('MyCustomType', model.inlined_typename)
        self.assertEqual({**expected_comment_descriptor, 'type': 'MyCustomType', 'disposition': 'inline'}, model.to_legacy_descriptor())
        self.assertEqual('inline MyCustomType', str(model))

    def test_can_create_struct_inline_placeholder(self):
        self._test_can_create_struct_inline_placeholder(None, {})

    def test_can_create_struct_inline_placeholder_with_comment(self):
        self._test_can_create_struct_inline_placeholder(Comment('# my amazing comment'), {'comments': 'my amazing comment'})


class ConditionalTests(unittest.TestCase):
    def test_can_create_conditional(self):
        # Act:
        model = Conditional(['SPECIAL_FLAG', 'not in', 'custom_flags'])

        # Assert:
        self.assertEqual('custom_flags', model.linked_field_name)
        self.assertEqual('not in', model.operation)
        self.assertEqual('SPECIAL_FLAG', model.value)
        self.assertEqual(
            {'condition': 'custom_flags', 'condition_operation': 'not in', 'condition_value': 'SPECIAL_FLAG'},
            model.to_legacy_descriptor())
        self.assertEqual('if SPECIAL_FLAG not in custom_flags', str(model))

    def test_can_copy_with_internal_member_references(self):
        # Arrange:
        model = Conditional(['SPECIAL_FLAG', 'not in', 'custom_flags'])

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_custom_flags', model.linked_field_name)
        self.assertEqual('not in', model.operation)
        self.assertEqual('SPECIAL_FLAG', model.value)


# endregion

# region Array

class ArrayTests(unittest.TestCase):
    def _assert_attributes(self, model, sort_key=None, alignment=None, is_byte_constrained=False):
        self.assertEqual(sort_key, model.sort_key)
        self.assertEqual(alignment, model.alignment)
        self.assertEqual(is_byte_constrained, model.is_byte_constrained)

    def test_can_create_udt_array(self):
        # Act:
        model = Array(['ElementType', 10])

        # Assert:
        self.assertEqual(10, model.size)
        self.assertEqual('array', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model)
        self.assertEqual({'disposition': 'array', 'size': 10, 'type': 'ElementType'}, model.to_legacy_descriptor())
        self.assertEqual('array(ElementType, 10)', str(model))

    def test_can_create_udt_array_sized(self):
        # Act:
        model = Array(['ElementType', 10])
        model.is_byte_constrained = True

        # Assert:
        self.assertEqual(10, model.size)
        self.assertEqual('array sized', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model, is_byte_constrained=True)
        self.assertEqual({'disposition': 'array sized', 'size': 10, 'type': 'ElementType'}, model.to_legacy_descriptor())
        self.assertEqual('array(ElementType, 10)', str(model))

    def test_can_create_udt_array_fill(self):
        # Act:
        model = Array(['ElementType', '__FILL__'])

        # Assert:
        self.assertEqual(0, model.size)
        self.assertEqual('array fill', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model)
        self.assertEqual({'disposition': 'array fill', 'size': 0, 'type': 'ElementType'}, model.to_legacy_descriptor())
        self.assertEqual('array(ElementType, __FILL__)', str(model))

    def test_can_create_udt_array_with_sort_key(self):
        # Act:
        model = Array(['ElementType', 10])
        model.sort_key = 'foo_field'

        # Assert:
        self.assertEqual(10, model.size)
        self.assertEqual('array', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model, sort_key='foo_field')
        self.assertEqual({'disposition': 'array', 'size': 10, 'type': 'ElementType', 'sort_key': 'foo_field'}, model.to_legacy_descriptor())
        self.assertEqual('array(ElementType, 10)', str(model))

    def test_can_create_udt_array_with_explicit_alignment(self):
        # Act:
        model = Array(['ElementType', 10])
        model.alignment = 4

        # Assert:
        self.assertEqual(10, model.size)
        self.assertEqual('array', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model, alignment=4)
        self.assertEqual({'disposition': 'array', 'size': 10, 'type': 'ElementType', 'alignment': 4}, model.to_legacy_descriptor())
        self.assertEqual('array(ElementType, 10)', str(model))

    def test_can_create_int_array(self):
        # Act:
        model = Array([FixedSizeInteger('int32'), 12])

        # Assert:
        self.assertEqual(12, model.size)
        self.assertEqual('array', model.disposition)
        self.assertEqual('int32', model.element_type.short_name)
        self._assert_attributes(model)
        self.assertEqual(
            {'disposition': 'array', 'size': 12, 'type': 'byte', 'element_disposition': {'size': 4, 'signedness': 'signed'}},
            model.to_legacy_descriptor())
        self.assertEqual('array(int32, 12)', str(model))

    def test_can_copy_without_internal_member_references(self):
        # Arrange:
        model = Array(['ElementType', 8])

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual(8, model.size)
        self.assertEqual('array', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model)

    def test_can_copy_with_internal_member_references(self):
        # Arrange:
        model = Array(['ElementType', 'bar_field'])
        model.sort_key = 'foo_field'
        model.alignment = 4
        model.is_byte_constrained = True

        # Act:
        model = model.copy('alpha')

        # Assert:
        self.assertEqual('alpha_bar_field', model.size)
        self.assertEqual('array sized', model.disposition)
        self.assertEqual('ElementType', model.element_type)
        self._assert_attributes(model, sort_key='alpha_foo_field', alignment=4, is_byte_constrained=True)


# endregion
