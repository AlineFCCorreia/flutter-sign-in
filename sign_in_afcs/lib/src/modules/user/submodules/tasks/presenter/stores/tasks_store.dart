import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/usecases/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/usecases/edit_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/usecases/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/usecases/remove_task.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';
import 'package:sign_in_afcs/src/modules/user/infra/socket_client.dart';

part 'tasks_store.g.dart';

// ignore: library_private_types_in_public_api
class TasksStore = _TasksStore with _$TasksStore;

abstract class _TasksStore with Store {
  final IAddTaskUseCase addTasksUseCase;
  final IGetTasksUseCase getTasksUseCase;
  final IRemoveTaskUseCase removeTaskUseCase;
  final IEditTaskUseCase editTaskUseCase;

  // final IGetTasksUseCase getTasksUseCase;
  _TasksStore(this.addTasksUseCase, this.getTasksUseCase,
      this.removeTaskUseCase, this.editTaskUseCase);

  final actualTask = Task();
  List<Task> taskList = ObservableList<Task>();

  //final usecase = UserUseCases(_repository)

  @observable
  String taskText = '';

  @observable
  bool enableButton = false;

  @observable
  String color = "g";

  @observable
  bool greenColorSelected = true;

  @observable
  bool redColorSelected = false;

  @observable
  bool yellowColorSelected = false;

  List<bool> colors = [true, false, false];

  @action
  void toggleEnableButton(String info) {
    enableButton = info.isNotEmpty;
  }

  @action
  void greenColorButtonSelect() {
    greenColorSelected = true;
    redColorSelected = false;
    yellowColorSelected = false;
    color = "g";
  }

  @action
  void yellowColorButtonSelect() {
    greenColorSelected = false;
    redColorSelected = false;
    yellowColorSelected = true;
    color = "y";
  }

  @action
  void redColorButtonSelect() {
    greenColorSelected = false;
    redColorSelected = true;
    yellowColorSelected = false;
    color = "r";
  }

  //Future<bool?> addTask(Uint8List taskEncoded);
  Future<bool?> addTask(String task, String userId) async {
    actualTask.userId = userId;
    actualTask.task = task;
    if (task.isNotEmpty) {
      final response = await addTasksUseCase.call(actualTask);
      if (response.$2 != null) {
        await getTask(userId);
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  Future<List<Task>?> getTask(String userId) async {
    final response = await getTasksUseCase.call(userId);

    if (response.$2 != null) {
      taskList.clear();
      taskList.addAll(response.$2!);
      return taskList;
    }
    return null;
  }

  Future<bool> removeTask(String taskId) async {
    final response = await removeTaskUseCase.call(taskId);

    if (response.$2 != null) {
      taskList.removeWhere((task) => task.id == taskId);
      return response.$2!;
    }
    return false;
  }

  Future<bool> editTask(Task task, String newText) async {
    if (newText.isNotEmpty) {
      task.task = newText;
      final response = await editTaskUseCase.call(task);
      if (response.$2 != null) {
        return response.$2!;
      }
    }

    return false;
  }
}
