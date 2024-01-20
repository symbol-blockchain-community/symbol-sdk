import re

CAMEL_CASE_PATTERN = re.compile(r'(?<!^)(?=[A-Z])')

SNAKE_CASE_PATTERN = re.compile(r'_([a-z])')

def _to_upper(matchobj):
	return matchobj.group(1).upper()

def underline_name(name):
	return CAMEL_CASE_PATTERN.sub('_', name).lower()

def lang_field_name(name):
	return SNAKE_CASE_PATTERN.sub(_to_upper, name)

def fix_size_name(name):
	return name if 'size' != name else f'{name}_'


def fix_name(name):
	if name in ('type', 'property'):
		return f'{name}_'

	return name
