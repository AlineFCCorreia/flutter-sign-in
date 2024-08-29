import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/tasks/domain/usecases/add_task.dart';
import 'package:sign_in_afcs/src/modules/tasks/infra/datasources/add_task.dart';

import 'package:sign_in_afcs/src/modules/user/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class TasksStore = _TasksStore with _$TasksStore;

abstract class _Taskstore with Store {
  final 
  final IAddTaskUseCase addTasksUseCase;
  final IGetTasksUseCase getTasksUseCase;
  Iget
  final actualUser = User();

  _TaskStore(this.loginUseCase, this.signupUseCase);
  //final usecase = UserUseCases(_repository)

  @observable
  String taskName = '';

  
}
