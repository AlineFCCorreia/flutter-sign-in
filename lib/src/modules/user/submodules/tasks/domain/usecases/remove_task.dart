import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';

abstract class IRemoveTaskUseCase {
  Future<(ITaskError?, bool?)> call(String taskId);
}

class RemoveTaskUseCase implements IRemoveTaskUseCase {
  final ITasksRepository _repository;

  RemoveTaskUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(String taskId) async {
    return await _repository.removeTask(taskId);
  }
}
