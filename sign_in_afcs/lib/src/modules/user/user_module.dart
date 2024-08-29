import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/tasks/tasks_module.dart';
import 'package:sign_in_afcs/src/modules/user/domain/repositories/user_repository.dart';
import 'package:sign_in_afcs/src/modules/user/domain/usecases/signin_usecase.dart';
import 'package:sign_in_afcs/src/modules/user/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/user/external/datasources/signin_datasourde.dart';
import 'package:sign_in_afcs/src/modules/user/external/datasources/signup_datasource.dart';
import 'package:sign_in_afcs/src/modules/user/infra/datasources/signin_datasource.dart';
import 'package:sign_in_afcs/src/modules/user/infra/datasources/signup_datasource.dart';
import 'package:sign_in_afcs/src/modules/user/infra/repositories/user_repository.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/signin_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/signup_page.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';
import 'package:http/http.dart' as http;

class UserModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);

    //Datasource
    i.add<ISignInDatasource>(SignInDatasource.new);
    i.add<ISignUpDatasource>(SignUpDatasource.new);
    //i.add<ISignupUseCase>(SignupUseCase.new);

    //Repositories
    i.add<IUserRepository>(UserRepository.new);

    //Usecases
    i.add<ILoginUseCase>(LoginUseCase.new);
    i.add<ISignupUseCase>(SignupUseCase.new);

    // Stores
    i.addSingleton(UserStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child("/sign_up/", child: (context) => const SignUpPage());
    r.module("/tasks/", module: TasksModule());
  }
}
