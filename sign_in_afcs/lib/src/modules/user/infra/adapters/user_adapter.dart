import 'dart:typed_data';
import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import "package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart";

class UserAdapter {
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