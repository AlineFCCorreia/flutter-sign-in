import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import 'package:sign_in_afcs/src/modules/user/infra/adapters/user_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/infra/datasources/signup_datasource.dart';

class SignUpDatasource implements ISignUpDatasource {
  final http.Client _client;
  final UserAdapter userAdapter = UserAdapter();

  SignUpDatasource(this._client);

  @override
  Future<bool?> signup(Uint8List userEncoded) async {
    try {
      //final uri = Uri.parse(executionStateRoute);
      final response = await _client.post(
          Uri.parse("http://127.0.0.1:10100/sign_up_user"),
          body: userEncoded);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw SignInError('error to signup, $e');
    }
    return null;
  }
}
