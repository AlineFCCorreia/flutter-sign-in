import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/datasources/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';

class GetTaskDataSource implements IGetTaskDataSource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  GetTaskDataSource(this._client);

  @override
  Future<Uint8List?> getTasks(String taskEncoded) async {
    try {
      //final uri = Uri.parse(executionStateRoute);
      final response = await _client
          .post(Uri.parse("127.0.0.1:10100/get_tasks"), body: taskEncoded);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      throw SignInError('error to retrieve tasks, $e');
    }
    return null;
  }
}
