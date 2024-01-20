import './bin/BaseValue.dart';
import './bin/ByteArray.dart';
import 'dart:typed_data';

class Amount extends BaseValue {
	static const int SIZE = 8;

	Amount(BigInt amount): super(SIZE, amount ?? BigInt.zero);

	static Amount deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Amount(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}

class UnresolvedAddress extends ByteArray {
  static const SIZE = 24;

  UnresolvedAddress(Uint8List unresolvedAddress) : super(SIZE, unresolvedAddress ?? Uint8List(24));

  int get size {
    return 24;
  }

  static UnresolvedAddress deserialize(Uint8List payload) {
    return UnresolvedAddress(Uint8List.fromList(payload));
  }

  Uint8List serialize() {
    return bytes;
  }
}