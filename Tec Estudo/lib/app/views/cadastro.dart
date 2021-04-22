import 'package:flutter/material.dart';

import 'inical.dart';
import 'login.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.cyan[600],
            margin: EdgeInsets.only(left: 20, top: 150, right: 20, bottom: 40),
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
                BuildInput("Nome :", 42),
                BuildInput("Sobrenome :", 8),
                BuildInput("Email :", 45),
                BuildInput("Senha :", 41),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        "Comfirme\n a senha :",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 26),
                        height: 25,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        "Código\ndo professor :",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7),
                        height: 25,
                        width: 195,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_rounded),
                      color: Colors.cyan[890],
                      splashColor: Colors.blue[900],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 60),
                    ButtonTheme(
                      minWidth: 150,
                      height: 60,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: RaisedButton(
                        color: Colors.cyan[890],
                        splashColor: Colors.blue[900],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inicial(),
                            ),
                          );
                        },
                        child: Text(
                          "Cadastar",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding BuildInput(String texto, double pad) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: BuildRow(texto, pad),
    );
  }

  Row BuildRow(String texto, double pad) {
    return Row(
      children: [
        Text(
          texto,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: pad),
          height: 25,
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
