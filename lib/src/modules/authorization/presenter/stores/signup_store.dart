import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/usecases/signup_usecase.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/states/signup_state.dart';

part 'signup_store.g.dart';

// ignore: library_private_types_in_public_api
class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  final ISignupUseCase signupUseCase;
  final actualUser = User();
  final signupState = SignupState();

  _SignupStore(this.signupUseCase);

  @observable
  bool showPassword = false;

  @observable
  bool enableButton = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  @action
  void toggleEnableButton(String info) {
    enableButton = info.isNotEmpty;
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
