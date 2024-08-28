import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

abstract class IUserRepository {
  Future<(IAppError?, User?)> login(User user);
  //vai ser implementado na infra

  Future<(IAppError?, bool?)> signup(User user);
  //vai ser implementado na infra
}
