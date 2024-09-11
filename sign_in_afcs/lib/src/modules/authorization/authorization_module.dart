import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/signin_store.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/signup_store.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/repositories/authorization_repository.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signin_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/external/datasources/signin_datasourde.dart';
import 'package:sign_in_afcs/src/modules/authorization/external/datasources/signup_datasource.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/datasources/signin_datasource.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/datasources/signup_datasource.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/repositories/authorization_repository.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/pages/signin_page.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/pages/signup_page.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/user_module.dart';

class AuthorizationModule extends Module {
  @override
  void binds(Injector i) {
    //Utils
    i.add(http.Client.new);

    //Datasource
    i.add<ISignInDatasource>(SignInDatasource.new);
    i.add<ISignUpDatasource>(SignUpDatasource.new);
    //i.add<ISignupUseCase>(SignupUseCase.new);

    //Repositories
    i.add<IAuthorizationRepository>(AuthorizationRepository.new);

    //Usecases
    i.add<ILoginUseCase>(LoginUseCase.new);
    i.add<ISignupUseCase>(SignupUseCase.new);

    // Stores
    i.addSingleton(SignupStore.new);
    i.addSingleton(SigninStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child("/sign_up/", child: (context) => const SignUpPage());
    r.module("/user_module/", module: UserModule());
  }
}
