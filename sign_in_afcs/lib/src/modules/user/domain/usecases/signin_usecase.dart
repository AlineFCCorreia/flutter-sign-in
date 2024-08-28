import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import 'package:sign_in_afcs/src/modules/user/domain/repositories/user_repository.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

abstract class ILoginUseCase {
  Future<(IAppError?, User?)> call(User user);
}

class LoginUseCase implements ILoginUseCase {
  final IUserRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<(IAppError?, User?)> call(User user) async {
    // if (user.name.isEmpty) {

    // } else {

    // }
    return await _repository.login(user);
  }
}
