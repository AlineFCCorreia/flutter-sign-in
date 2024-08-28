import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/tasks/tasks_module.dart';

import 'package:sign_in_afcs/src/modules/user/user_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: UserModule());
  }
}
