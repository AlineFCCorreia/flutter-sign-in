import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/authorization/domain/errors/authorization_error.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/adapters/authorization_adapter.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/datasources/signup_datasource.dart';

class SignUpDatasource implements ISignUpDatasource {
  final http.Client _client;
  final AuthorizationAdapter authorizationAdapter = AuthorizationAdapter();

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
      throw SignUpError('error to signup, $e');
    }
    return null;
  }
}
