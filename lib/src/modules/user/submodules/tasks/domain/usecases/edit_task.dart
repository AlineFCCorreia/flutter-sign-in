import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';



abstract class IEditTaskUseCase {
  Future<(ITaskError?, bool?)> call(Task task);
}

class EditTaskUseCase implements IEditTaskUseCase {
  final ITasksRepository _repository;

  EditTaskUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(Task task) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.editTask(task);
  }
}