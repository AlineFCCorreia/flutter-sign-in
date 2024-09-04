import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/domain/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/domain/usecases/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/domain/usecases/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/external/datasources/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/external/datasources/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/infra/datasources/add_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/infra/datasources/get_task.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/infra/repositories/tasks_repository.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/presenter/pages/create_tasks_page.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/presenter/pages/tasks_page.dart';
import 'package:sign_in_afcs/src/modules/user/tasks/presenter/stores/tasks_store.dart';
import 'package:http/http.dart' as http;

class TasksModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);

    //Datasource
    i.add<IAddTaskDataSource>(AddTaskDataSource.new);
    i.add<IGetTaskDataSource>(GetTaskDataSource.new);

    //Repositories
    i.add<ITasksRepository>(TasksRepository.new);

    //Usecases
    i.add<IAddTaskUseCase>(AddTaskUseCase.new);
    i.add<IGetTasksUseCase>(GetTasksUseCase.new);

    // Stores
    i.addSingleton(TasksStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => TaskPage(user: r.args.data));
    r.child("/create_task/",
        child: (context) => CreateTaskPage(user: r.args.data));

    //r.child('/a', child: (context) => const Comoqueescrev());
  }
}
