import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hackatagro/utils/firebase_auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:hackatagro/pages/cadastro/cadastro_provider.dart';
import 'package:hackatagro/utils/app_route.dart';
import './login_provider.dart' as LoginProvider;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool signUp = false;
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String>? _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return null;
  }

  Future<String>? _recoverPassword(String name) {
    print('Name: $name');
    return null;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (context.read<FirebaseAuthProvider>().isAuthenticated) {
        Navigator.pushReplacementNamed(context, AppRoute.routeHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Hackatagro',
        logo: 'assets/app/icons/icon.png',
        onLogin: (LoginData data) async {
          return await context
              .read<FirebaseAuthProvider>()
              .signIn(data.name, data.password);
        },
        onSignup: (LoginData data) async {
          return await context
              .read<FirebaseAuthProvider>()
              .signUp(data.name, data.password);
        },
        onSubmitAnimationCompleted: () {
          Navigator.pushReplacementNamed(context, AppRoute.routeHome);
        },
        onRecoverPassword: _recoverPassword,
        messages: LoginMessages(
          userHint: 'Email',
          passwordHint: 'Senha',
          confirmPasswordHint: 'Confirmar',
          loginButton: 'ACESSAR',
          signupButton: 'CADASTRAR',
          forgotPasswordButton: 'Esqueci a senha?',
          recoverPasswordButton: 'Esqueci a senha',
          goBackButton: 'VOLTAR',
          confirmPasswordError: 'Senhas diferentes!',
          recoverPasswordDescription:
              'Insira seu email e vamos enviar instruções',
          recoverPasswordSuccess: 'Password rescued successfully',
        ));
  }
}
