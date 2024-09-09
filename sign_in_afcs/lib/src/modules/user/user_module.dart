import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/presenter/pages/user_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/profile/profile_module.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/tasks_module.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);

    //Stores
    i.addSingleton(UserStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const UserPage(),
        children: [
          ModuleRoute("/profile_module/", module: ProfileModule()),
          ModuleRoute("/tasks_module/", module: TasksModule())
        ]);
  }
}
