import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/tasks/tasks_module.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/user_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);
    // Stores
    i.addSingleton(UserStore.new);
  }

  @override
  void routes(r) {
    r.module("/user/", module: UserModule());
    r.module("/tasks/", module: TasksModule());
  }
}
