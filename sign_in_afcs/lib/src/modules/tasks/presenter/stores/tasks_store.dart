import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/tasks/domain/usecases/add_task.dart';
import 'package:sign_in_afcs/src/modules/tasks/domain/usecases/get_task.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/proto/tasks.pb.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

part 'tasks_store.g.dart';

// ignore: library_private_types_in_public_api
class TasksStore = _TasksStore with _$TasksStore;

abstract class _TasksStore with Store {
  final IAddTaskUseCase addTasksUseCase;
  final IGetTasksUseCase getTasksUseCase;

  final actualTask = Task();
  List<Task> taskList = ObservableList<Task>();

  _TasksStore(this.addTasksUseCase, this.getTasksUseCase);
  //final usecase = UserUseCases(_repository)

  @observable
  String taskText = '';

  //Future<bool?> addTask(Uint8List taskEncoded);
  Future<bool?> addTask(String task, String userId) async {
    actualTask.userId = userId;
    actualTask.task = taskText;
    if (taskText != " ") {
      final response = await addTasksUseCase.call(actualTask);
      if (response.$2 != null) {
        taskList.insert(0, actualTask);
        return true;
      }
      return false;
    } else {
      return false;
    }
  }
}
