import 'package:flutter/material.dart';

import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final senhaController = TextEditingController();

  var http;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset("assets/FenoxTec2.png"),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(labelText: 'Usuário'),
                  validator: Validatorless.multiple([
                    Validatorless.required(
                      'Preencha seu usuário',
                    ),
                    Validatorless.min(
                        6, 'Usuário incorreto ou senha incorreta'),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Senha'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                          6, 'Usuário incorreto ou senha incorreta'),
                    ])),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        Navigator.pushNamed(context, '/backoffice');
                      }
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Entrar",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ]))
              ],
            )));
  }
}
