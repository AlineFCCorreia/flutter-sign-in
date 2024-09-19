import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/edit_task.dart';

//return bool
class EditTaskDataSource implements IEditTaskDataSource {
  final http.Client _client;
  final taskAdapter = TaskAdapter();

  EditTaskDataSource(this._client);

  @override
  Future<bool?> editTask(Uint8List taskEncoded) async {
    try {
      final response = await _client.put(
          Uri.parse("http://127.0.0.1:10100/edit_task_by_id"),
          body: taskEncoded);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw AddTaskError('error in edit task, $e');
    }
    return null;
  }
}
