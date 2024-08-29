import 'package:sign_in_afcs/src/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/proto/tasks.pb.dart';

abstract class ITasksRepository {
  Future<(IAppError?, bool?)> addTask(Task task);
  //vai ser implementado na infra

  Future<(IAppError?, Tasks?)> geTasks(String userId);
  //vai ser implementado na infra
}
