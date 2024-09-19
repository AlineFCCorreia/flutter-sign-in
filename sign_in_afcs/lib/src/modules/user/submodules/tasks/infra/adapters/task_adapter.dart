import 'dart:typed_data';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

class TaskAdapter {
  static List<Task>? dataToProto(Uint8List? data) {
    try {
      if (data != null) {
        final response =  Tasks.fromBuffer(data);
        return response.tasks;
      }
      return null;
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }

  static Uint8List? protoToData(Task data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }
}
