import 'dart:typed_data';

//return bool
abstract class IEditTaskDataSource {
  Future<bool?> editTask(Uint8List taskEncoded);
}
