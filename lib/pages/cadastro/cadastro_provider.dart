import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:hackatagro/models/local/usuario.dart';
import 'package:hackatagro/services/rest_api/api_user.dart';
import 'package:hackatagro/services/safety/change_notifier_safety.dart';
import 'package:hackatagro/utils/app_config.dart';
import 'package:hackatagro/utils/firebase_auth_provider.dart';

class CadastroProvider extends ChangeNotifierSafety {
  Usuario? usuario;
  ApiUser _api;
  FirebaseAuthProvider _firebaseAuth;
  String? email;
  String? password;

  CadastroProvider(this._api, this._firebaseAuth);

  Future<void> cadastrar(
      String name, String firebaseUID, String birthDate) async {
    Usuario usuario = new Usuario(
        birthDate: birthDate,
        email: email!,
        firebaseUID: firebaseUID,
        id: '',
        img: '',
        name: name,
        plataforma: Platform.isAndroid ? "Android" : "IOS",
        userPlan: 'free');

    this.usuario = usuario;
    final Response<Map<String, dynamic>> result =
        await _api.signUp(usuario).timeout(const Duration(seconds: 30));
    if (result.data != null) {
      /// Save credential

      notifyListeners();
    } else {
      throw DioError(
          requestOptions: RequestOptions(path: AppConfig.I.env.apiBaseUrl),
          error: 'Textos error',
          type: DioErrorType.response);
    }
    notifyListeners();
  }

  @override
  void resetState() {}
}
