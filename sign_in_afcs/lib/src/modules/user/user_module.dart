import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/signin_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/signup_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:http/http.dart' as http;

class UserModule extends Module{
   @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);
     // Stores
    i.addSingleton(UserStore.new);


@override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child("/sign_up/", child: (context) => const SignUpPage());

  }

}
}