import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

abstract class IAuthorizationRepository {
  Future<(IAppError?, User?)> login(User user);
  //vai ser implementado na infra

  Future<(IAppError?, bool?)> signup(User user);
  //vai ser implementado na infra
}
