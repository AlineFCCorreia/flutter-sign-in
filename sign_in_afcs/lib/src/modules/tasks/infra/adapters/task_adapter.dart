import 'dart:typed_data';
import 'package:sign_in_afcs/src/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/proto/tasks.pb.dart';
import "package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart";

class TaskAdapter {
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

  Uint8List? protoToData(Task data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }
}
