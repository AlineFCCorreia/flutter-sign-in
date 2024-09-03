import 'package:sign_in_afcs/src/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/proto/tasks.pb.dart';



abstract class IAddTaskUseCase {
  Future<(ITaskError?, bool?)> call(Task task);
}

class AddTaskUseCase implements IAddTaskUseCase {
  final ITasksRepository _repository;

  AddTaskUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(Task task) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.addTask(task);
  }
}