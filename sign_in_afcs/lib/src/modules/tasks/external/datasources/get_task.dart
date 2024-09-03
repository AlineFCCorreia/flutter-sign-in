import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/datasources/get_task.dart';

class GetTaskDataSource implements IGetTaskDataSource {
  final http.Client _client;
  final taskAdapter = TaskAdapter();

  GetTaskDataSource(this._client);

  @override
  Future<Uint8List?> getTasks(String userId) async {
    try {
      //final uri = Uri.parse(executionStateRoute);
      final response = await _client.get(
          Uri.parse("http://127.0.0.1:10100/get_tasks"),
          headers: {"id": userId});
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      throw GetTaskError('error to retrieve tasks, $e');
    }
    return null;
  }
}
