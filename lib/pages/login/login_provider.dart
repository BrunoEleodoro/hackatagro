import 'package:flutter_login/flutter_login.dart';
import 'package:hackatagro/services/safety/change_notifier_safety.dart';
import 'package:hackatagro/utils/firebase_auth_provider.dart';

class LoginProvider extends ChangeNotifierSafety {
  FirebaseAuthProvider _firebaseAuth;
  LoginProvider(this._firebaseAuth);

  Future<String?> login(LoginData data) async {
    return _firebaseAuth.signIn(data.name, data.password);
  }

  Future<String?> cadastro(LoginData data) async {
    return _firebaseAuth.signUp(data.name, data.password);
  }

  Future<String?> recuperarSenha(LoginData data) async {
    return _firebaseAuth.signUp(data.name, data.password);
  }
//  Future<String> _authUser(LoginData data) {
//     print('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }

//   Future<String> _recoverPassword(String name) {
//     print('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return null;
//     });
//   }

  @override
  void resetState() {}
}
