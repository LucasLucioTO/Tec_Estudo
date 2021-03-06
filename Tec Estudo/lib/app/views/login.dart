
import 'package:flutter/material.dart';
import 'package:teste/app/database/dao/aluno_dao_impl.dart';
import 'package:teste/app/database/dao/professor_dao_impl.dart';
import 'package:teste/app/domain/entities/aluno.dart';
import 'package:teste/app/domain/entities/professor.dart';

import 'inical.dart';
import 'Cadastro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

Future<List<Aluno>> _buscarAlunos()async{
  return AlunoDAOimpl().find();
}

Future<List<Professor>> _buscarProfessor()async{
  return ProfessorDAOimpl().find();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.cyan[600],
            margin: EdgeInsets.only(left: 20, top: 170, right: 20, bottom: 40),
            child: Column(
              children: [
                Text(
                  "Tec Estudo",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Login',
                        ),
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'insira um login';
                          } else if (value != "admin") {
                            return 'insira um login valido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Senha',
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                        obscureText: _secureText,
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'insira uma senha';
                          } else if (value != "admin") {
                            return 'insira uma senha valido';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Esqueceu a sua senha?"),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cadastro(),
                      ),
                    );
                  },
                  child: Text("N??o tem conta?"),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  minWidth: 150,
                  height: 60,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    color: Colors.cyan[890],
                    splashColor: Colors.blue[900],
                    onPressed: () => {
                      if (_formKey.currentState.validate())
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inicial(),
                            ),
                          ),
                        }
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
