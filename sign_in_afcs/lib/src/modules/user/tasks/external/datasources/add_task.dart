import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/infra/datasources/add_task.dart';

//return bool
class AddTaskDataSource implements IAddTaskDataSource {
  final http.Client _client;
  final taskAdapter = TaskAdapter();

  AddTaskDataSource(this._client);

  @override
  Future<bool?> addTask(Uint8List taskEncoded) async {
    try {
      final response = await _client.post(
          Uri.parse("http://127.0.0.1:10100/add_task"),
          body: taskEncoded);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw AddTaskError('error in add task, $e');
    }
    return null;
  }
}
