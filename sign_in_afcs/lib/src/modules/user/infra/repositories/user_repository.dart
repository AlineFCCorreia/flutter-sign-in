import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import 'package:sign_in_afcs/src/modules/user/domain/repositories/user_repository.dart';
import 'package:sign_in_afcs/src/modules/user/infra/adapters/user_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/infra/datasources/signin_datasource.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

class UserRepository implements IUserRepository {
  final ISignInDatasource _signInDatasource;
  final userAdapter = UserAdapter();

  UserRepository(this._signInDatasource);

  @override
  Future<(IAppError?, User?)> login(User data) async {
    try {
      final userEncoded = userAdapter.protoToData(data);
      final response = await _signInDatasource.login(userEncoded!);
      final user = userAdapter.dataFromProto(response);

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
      final userEncoded = userAdapter.protoToData(data);
      final response = await _signInDatasource.login(userEncoded!); // TODO fix to signup

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
