import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/user/domain/usecases/signin_usecase.dart';
import 'package:sign_in_afcs/src/modules/user/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  late final ILoginUseCase loginUseCase;
  late final ISignupUseCase signUseCase;
  final actualUser = User();

  _UserStore(this.loginUseCase, this.signUseCase);
  //final usecase = UserUseCases(_repository)

  @observable
  String username = '';

  @observable
  String password = '';

  @action
  Future<bool> login(String username, String password) async {
    actualUser.name = username;
    actualUser.password = password;
    final response = await loginUseCase.call(actualUser);
    if (response.$2 != null) {
      return true;
    }
    return false;
  }

  @action
  Future<bool> signup(String username, String password) async {
    final response =
        await loginUseCase.call(User(name: username, password: password));
    if (response.$2 != null) {
      return true;
    }
    return false;
  }
}
