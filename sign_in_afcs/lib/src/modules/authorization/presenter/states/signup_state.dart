import 'package:mobx/mobx.dart';

part 'signup_state.g.dart';

abstract class ISignupState {
  void clearError();
  void setAllError(String message);
}

// ignore: library_private_types_in_public_api
class SignupState = _SignupState with _$SignupState;

abstract class _SignupState with Store implements ISignupState {
  @observable
  String? errorGetState;

  @action
  @override
  void clearError() {
    errorGetState = null;
  }

  @action
  @override
  void setAllError(String message) {
    errorGetState = message;
  }
}
