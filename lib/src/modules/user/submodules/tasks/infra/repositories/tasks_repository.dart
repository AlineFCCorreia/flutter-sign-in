import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';

import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/adapters/task_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/edit_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/datasources/remove_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

class TasksRepository implements ITasksRepository {
  final IAddTaskDataSource _addTaskDataSource;
  final IGetTaskDataSource _getTaskDataSource;
  final IRemoveTaskDataSource _removeTaskDataSource;
  final IEditTaskDataSource _editTaskDataSource;

  //final taskAdapter = TaskAdapter();

  TasksRepository(this._addTaskDataSource, this._getTaskDataSource,
      this._removeTaskDataSource, this._editTaskDataSource);

  @override
  Future<(ITaskError?, bool?)> addTask(Task data) async {
    try {
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

  @override
  Future<(ITaskError?, bool?)> removeTask(String taskId) async {
    try {
      final response = await _removeTaskDataSource.removeTasks(taskId);
      if (response != null) {
        return (null, true);
      }
      return (RemoveTaskError('task not found'), null);
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

 @override
  Future<(ITaskError?, bool?)> editTask(Task data) async {
    try {
      final taskEncoded = TaskAdapter.protoToData(data);
      final response = await _editTaskDataSource.editTask(taskEncoded!);

      if (response != null) {
        return (null, true);
      } else {
        return (AddTaskError("error to edit task"), null);
      }
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

}
