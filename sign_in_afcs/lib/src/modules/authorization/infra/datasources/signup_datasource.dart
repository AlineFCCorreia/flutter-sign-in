import 'dart:typed_data';

abstract class ISignUpDatasource {
  Future<bool?> signup(Uint8List userEncoded);
}
