import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import 'package:sign_in_afcs/src/modules/authorization/domain/repositories/authorization_repository.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/adapters/authorization_adapter.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/datasources/signin_datasource.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/datasources/signup_datasource.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

class AuthorizationRepository implements IAuthorizationRepository {
  final ISignInDatasource _signInDatasource;
  final ISignUpDatasource _signUpDatasource;
  final authorizationAdapter = AuthorizationAdapter();

  AuthorizationRepository(this._signInDatasource, this._signUpDatasource);

  @override
  Future<(IAppError?, User?)> login(User data) async {
    try {
      final userEncoded = authorizationAdapter.protoToData(data);
      final response = await _signInDatasource.login(userEncoded!);
      final user = authorizationAdapter.dataFromProto(response);

      if (user != null) {
        return (null, user);
      } else {
        return (SignInError("User not found"), null);
      }
    } on IAppError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(IAppError?, bool?)> signup(User data) async {
    try {
      final userEncoded = authorizationAdapter.protoToData(data);
      final response = await _signUpDatasource.signup(userEncoded!);

      if (response != null) {
        return (null, true);
      } else {
        return (SignUpError("User not found"), false);
      }
    } on IAppError catch (e) {
      return (e, false);
    }
  }
}
