def indent(text):
	output = ''
	for line in text.splitlines():
		prefix = '\t' if line else ''
		output += f'{prefix}{line}\n'
	return output

def uint32_to_int32(x):
  return (x & 0xFFFFFFFF) - (1 << 32) if x & (1 << 31) else x
