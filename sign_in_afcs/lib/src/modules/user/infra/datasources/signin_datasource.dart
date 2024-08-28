import 'dart:typed_data';

abstract class ISignInDatasource {
  Future<Uint8List?> login(Uint8List userEncoded);
}
