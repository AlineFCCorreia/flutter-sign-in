import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signin_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

part 'authorization_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthorizationStore = _AuthorizationStore with _$AuthorizationStore;

abstract class _AuthorizationStore with Store {
  final ILoginUseCase loginUseCase;
  final ISignupUseCase signupUseCase;
  final actualUser = User();

  _AuthorizationStore(this.loginUseCase, this.signupUseCase);
  //final usecase = UserUseCases(_repository)

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  Future<bool> login(String username, String password) async {
    actualUser.name = username;
    actualUser.password = password;
    final response = await loginUseCase.call(actualUser);
    if (response.$2 != null) {
      actualUser.id = response.$2!.id;
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String username, String password, String confirmPassword) async {
    if (password == confirmPassword) {
      final response =
          await signupUseCase.call(User(name: username, password: password));
      if (response.$2 != null) {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }
}
