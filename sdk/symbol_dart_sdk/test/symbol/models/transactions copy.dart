import 'package:test/test.dart';
import '../../../bin/symbol/models.dart';
import '../../../bin/symbol/ITransaction.dart';
import '../../../bin/utils/converter.dart';

void transactionTest(String name, String payload, ITransaction tx){
  test(name, () {
    expect(bytesToHex((TransactionFactory().deserialize(payload) as ITransaction).serialize()), payload);
    expect(bytesToHex(tx.serialize()).toUpperCase(), payload);
  });
}

void main() async {
  
}
