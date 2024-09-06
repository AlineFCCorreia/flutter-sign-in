import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';



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