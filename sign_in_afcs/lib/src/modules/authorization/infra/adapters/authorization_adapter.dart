import 'dart:typed_data';
import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import "package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart";

class AuthorizationAdapter {
  User? dataFromProto(Uint8List? data) {
    try {
      if (data != null) {
        return User.fromBuffer(data);
      }
      return null;
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }

  Uint8List? protoToData(User data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }
}
//nome cpf email celular