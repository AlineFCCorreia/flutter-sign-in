import 'dart:typed_data';

abstract class IRemoveTaskDataSource {
  Future<bool?> removeTasks(String taskId);
}
