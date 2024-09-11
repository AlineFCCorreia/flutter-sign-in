import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/profile/presenter/pages/profile_page.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/profile/presenter/stores/profile_store.dart';

class ProfileModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);

    //Datasources

    //Repositories

    //Usecases

    // Stores
    i.addSingleton(ProfileStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) =>  ProfilePage(user: r.args.data));
  }
}
