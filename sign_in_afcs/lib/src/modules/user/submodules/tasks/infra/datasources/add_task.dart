import 'dart:typed_data';

//return bool
abstract class IAddTaskDataSource {
  Future<bool?> addTask(Uint8List taskEncoded);
}
