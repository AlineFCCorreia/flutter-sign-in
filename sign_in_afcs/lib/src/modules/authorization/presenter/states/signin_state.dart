import 'package:mobx/mobx.dart';

part 'signin_state.g.dart';

abstract class ISigninState {
  void clearError();
  void setAllError(String message);
}

// ignore: library_private_types_in_public_api
class SigninState = _SigninState with _$SigninState;

abstract class _SigninState with Store implements ISigninState {
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
