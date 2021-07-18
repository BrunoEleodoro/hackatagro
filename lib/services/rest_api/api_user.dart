import 'package:dio/dio.dart';
import 'package:hackatagro/models/local/usuario.dart';

import 'api.dart';

class ApiUser extends Api {
  //Cadastro
  Future<Response<Map<String, dynamic>>> signUp(Usuario usuario) async {
    final Options options = await getOptions();
    return wrapE(() => dio.post<Map<String, dynamic>>('$apiBaseUrl/cadastro',
            options: options,
            data: <String, String?>{
              'name': usuario.name,
              'email': usuario.email,
              'birthDate': usuario.birthDate,
              'plataforma': usuario.plataforma,
              'firebaseUID': usuario.firebaseUID
            }));
  }

  /// Login
  Future<Response<Map<String, dynamic>>> logIn(
      String? email, String? password) async {
    final Options options = await getOptions();
    return wrapE(() => dio.post<Map<String, dynamic>>('$apiBaseUrl/login',
            options: options,
            data: <String, String?>{
              'email': email,
              'password': password,
            }));
  }

  /// Login With Error
  Future<Response<Map<String, dynamic>>> logInWithError() async {
    final Options options = await getOptions();
    return wrapE(() => dio.post<Map<String, dynamic>>('$apiBaseUrl/login-err',
            options: options,
            data: <String, String>{
              'email': 'email',
              'password': 'password',
            }));
  }
}
