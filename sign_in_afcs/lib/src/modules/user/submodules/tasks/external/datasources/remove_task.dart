import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/remove_task.dart';

class RemoveTaskDataSource implements IRemoveTaskDataSource {
  final http.Client _client;
  final taskAdapter = TaskAdapter();

  RemoveTaskDataSource(this._client);

  @override //remove_task_by_id
  Future<bool?> removeTasks(String taskId) async {
    try {
      final response = await _client.delete(
          Uri.parse("http://127.0.0.1:10100/remove_task_by_id"),
          headers: {"id": taskId});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw RemoveTaskError("error in delete task, $e");
    }
    return null;
  }
}
