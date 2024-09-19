import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

abstract class IGetTasksUseCase {
  Future<(ITaskError?, List<Task>?)> call(String userId);
}

class GetTasksUseCase implements IGetTasksUseCase {
  final ITasksRepository _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<(ITaskError?, List<Task>?)> call(String userId) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.getTasks(userId);
  }
}
