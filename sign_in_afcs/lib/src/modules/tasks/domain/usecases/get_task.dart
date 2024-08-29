import 'package:sign_in_afcs/src/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/proto/tasks.pb.dart';

abstract class IGetTasksUseCase {
  Future<(IAppError?, bool?)> call(Task task);
}

class GetTasksUseCase implements IGetTasksUseCase {
  final IGetTasksUseCase _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<(IAppError?, bool?)> call(Task task) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.getTasks(task);
  }
}
