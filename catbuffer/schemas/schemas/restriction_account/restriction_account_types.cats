import "entity.cats"

# enumeration of account restriction types
enum AccountRestrictionType : uint16
	# restriction type is an address
	address = 0x0001

	# restriction type is a mosaic identifier
	mosaicId = 0x0002

	# restriction type is a transaction type
	transactionType = 0x0004

	# restriction is interpreted as outgoing
	outgoing = 0x4000

	# restriction is interpreted as blocking operation
	block = 0x8000
