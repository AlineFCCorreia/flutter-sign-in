import 'dart:typed_data';

abstract class IGetTaskDataSource {
  Future<Uint8List?> getTasks(String userId);
}
