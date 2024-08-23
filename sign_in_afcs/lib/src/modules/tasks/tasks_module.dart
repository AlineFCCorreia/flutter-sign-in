import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:http/http.dart' as http;

class TasksModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);
    // Stores
    i.addSingleton(UserStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const TasksPage());
    //r.child("/tasks/", child: (context) => const TasksPage());
  }
}
