import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/external/socket/socket_client.dart';
import 'package:sign_in_afcs/src/modules/user/infra/socket_client.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/user_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/profile/profile_module.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/tasks_module.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);
    i.addSingleton<ISocketClient>(SocketClient.new);

    //Stores
    i.addSingleton(UserStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => UserPage(user: r.args.data),
        children: [
          ModuleRoute("/profile_module/", module: ProfileModule()),
          ModuleRoute("/tasks_module/", module: TasksModule())
        ]);
  }
}
