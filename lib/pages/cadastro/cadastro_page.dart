import 'package:flutter/material.dart';
import 'package:hackatagro/utils/app_route.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoute.routeLogin, (route) => false);
                },
              ),
              title: Text('Cadastro', style: TextStyle())),
          body: SingleChildScrollView(
              child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 40),
                TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome Completo'))
              ],
            ),
          ))),
    );
  }
}
