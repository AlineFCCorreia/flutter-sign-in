import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';

import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

class TasksRepository implements ITasksRepository {
  final IAddTaskDataSource _addTaskDataSource;
  final IGetTaskDataSource _getTaskDataSource;

  //final taskAdapter = TaskAdapter();

  TasksRepository(this._addTaskDataSource, this._getTaskDataSource);

  @override
  Future<(ITaskError?, bool?)> addTask(Task data) async {
    try {
      print(data);
      final taskEncoded = TaskAdapter.protoToData(data);
      final response = await _addTaskDataSource.addTask(taskEncoded!);

      if (response != null) {
        return (null, true);
      } else {
        return (AddTaskError("error to add task"), null);
      }
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(ITaskError?, List<Task>?)> getTasks(String idUser) async {
    try {
      final response = await _getTaskDataSource.getTasks(idUser);
      final tasks = TaskAdapter.dataToProto(response);
      if (tasks != null) {
        return (null, tasks);
      }
      return (GetTaskError('tasks not found'), null);
    } on ITaskError catch (e) {
      return (e, null);
    }
  }
}
