import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signin_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/states/signin_state.dart';

part 'signin_store.g.dart';

// ignore: library_private_types_in_public_api
class SigninStore = _SigninStore with _$SigninStore;

abstract class _SigninStore with Store {
  final ILoginUseCase loginUseCase;
  final actualUser = User();
  final signinState = SigninState();

  _SigninStore(this.loginUseCase);

  @observable
  bool showPassword = false;

  @observable
  bool enableButton = false;

  @action
  void toggleEnableButton(String info) {
    enableButton = info.isNotEmpty;
  }

  @action
  void toggleShowPassword() => showPassword = !showPassword;

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
}
