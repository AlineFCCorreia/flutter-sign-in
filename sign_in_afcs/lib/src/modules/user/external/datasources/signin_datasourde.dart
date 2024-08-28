import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sign_in_afcs/src/modules/user/domain/errors/user_error.dart';
import 'package:sign_in_afcs/src/modules/user/infra/adapters/user_adapter.dart';
import 'package:sign_in_afcs/src/modules/user/infra/datasources/signin_datasource.dart';

class SignInDatasource implements ISignInDatasource {
  final http.Client _client;
  final UserAdapter userAdapter = UserAdapter();

  SignInDatasource(this._client);

  @override
  Future<Uint8List?> login(Uint8List userEncoded) async {
    try {
      //final uri = Uri.parse(executionStateRoute);
      final response = await _client
          .post(Uri.parse("http://127.0.0.1:10100/login"), body: userEncoded);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      throw SignInError('error to signin, $e');
    }
    return null;
  }
}
