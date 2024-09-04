import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/repositories/authorization_repository.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

abstract class ILoginUseCase {
  Future<(IAppError?, User?)> call(User user);
}

class LoginUseCase implements ILoginUseCase {
  final IAuthorizationRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<(IAppError?, User?)> call(User user) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.login(user);
  }
}
