import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/repositories/authorization_repository.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

abstract class ISignupUseCase {
  Future<(IAppError?, bool?)> call(User user);
}

class SignupUseCase implements ISignupUseCase {
  final IAuthorizationRepository _repository;

  SignupUseCase(this._repository);

  @override
  Future<(IAppError?, bool?)> call(User user) async {
    if (user.name.isEmpty) {

    } else {

    }
    return await _repository.signup(user);
  }
}
