import json
import os

def to_camel_case(input):
  words = input.split('_')
  return words[0].lower() + ''.join(word.title() for word in words[1:])

def to_pascal_case(input):
  return ''.join(word.title() for word in input.split('_'))

def remove_transaction_version(input_string):
  return input_string.replace("_transaction_v1", "").replace("_transaction_v2", "")

def main():
    # スクリプトの位置を取得
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # 出力ファイルのパスを作成
    output_path = os.path.join(script_dir, '../test.dart')

    # 出力ファイルが存在する場合は削除する
    if os.path.exists(output_path):
      os.remove(output_path)

    # ファイルを開いてJSONを読み込む
    with open('/Users/matsukawatoshiya/Desktop/symbol-dart/symbol/tests/vectors/symbol/models/transactions.json', 'r') as file:
      data = json.load(file)

    # 出力ファイルを開く
    with open(output_path, 'w') as output_file:
        # テストコードの先頭部分
      test_code_header = """
import 'package:test/test.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import '../bin/symbol/models.dart';
import '../bin/utils/converter.dart';

void main() {
"""

      # テストコードの末尾部分
      test_code_footer = """
}
      """
      # JSONの各要素に対して処理を行う
      #for element in data:
      element = data[0]
      schema_name = element['schema_name']
      test_name = element['test_name']
      payload = element['payload']
      descriptor = element['descriptor']
      tx_type = descriptor['type']
      print(schema_name)

      # テストコードを生成
      test_code = f"""
  test('{test_name}', () {{
    var payload = '{payload}';
    var tx = {schema_name}(
      network: NetworkType.TESTNET, 
      type: TransactionType.{remove_transaction_version(tx_type).upper()},
      restrictionFlags: AccountRestrictionFlags.ADDRESS,
      restrictionAdditions: [
        {', '.join(f"UnresolvedAddress('{addr}')" for addr in descriptor['restriction_additions'])},
      ],
      restrictionDeletions: [
        {', '.join(f"UnresolvedAddress('{addr}')" for addr in descriptor['restriction_deletions'])},
      ], 
      signerPublicKey: PublicKey('0x{descriptor['signer_public_key']}'),
      signature: Signature('0x{descriptor['signature']}'),
      fee: Amount('{descriptor['fee']}'),
      deadline: Timestamp({descriptor['deadline']}));
    expect(hex.encode(tx.serialize()).toUpperCase(), payload);
  }});
"""
      # テストコードを出力ファイルに書き込む
      output_file.write(test_code_header)
      output_file.write(test_code)
      output_file.write(test_code_footer)

if __name__ == "__main__":
    main()