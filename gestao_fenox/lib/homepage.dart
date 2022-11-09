import 'dart:convert';

import 'package:controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backoffice.dart';

class LoginPage extends StatelessWidget {
  final _emailocontroller = TextEditingController();
  final _senhacontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var http;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/FenoxTec2.png"),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailocontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              validator: (Usuario) {
                if (Usuario == null || Usuario.isEmpty) {
                  return 'Por favor, preencher a senha';
                } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(_emailocontroller.text)) {
                  return 'Por favor, digitar Usuário correto';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _senhacontroller,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              validator: (senha) {
                if (senha == null || senha.isEmpty) {
                  return 'Por favor, preencher a senha';
                } else if (senha.length < 6) {
                  return 'Po favor, digite a senha correta';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 255, 254, 254),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
              child: SizedBox.expand(
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fenoxlogo3.png"),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (_formKey.currentState.validate()) {
                      bool deucerto = await Login();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (deucerto) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BackOffice(),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> Login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://backoffice.fenoxapp.com.br');
    var resposta = await http.prost(
      url,
      body: {
        'username': _emailocontroller.text,
        'senha': _senhacontroller.text,
      },
    );
    if (resposta.statusCode == 200) {
      print(jsonDecode(resposta.body)['token']);
      return true;
    } else {
      print(jsonDecode(resposta.body));
      return false;
    }
  }
}
