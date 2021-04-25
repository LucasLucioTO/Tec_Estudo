import 'package:flutter/material.dart';
import 'package:teste/app/domain/models/borda.dart';

import 'Configurar.dart';
import 'Perfil.dart';
import 'cadastro.dart';
import 'login.dart';

import 'video_aula.dart';
import 'monitoria.dart';
import 'exercicio.dart';
import 'material.dart';

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  List listaPagina = [
    Video(),
    Monitoria(),
    Exercicio(),
    Materialest(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tec Estudo",
        ),
        actions: [
          buildPopupMenuButton(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, top: 140, right: 0, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                buildButtonTheme("Vídeo Aula", 0, context),
                SizedBox(width: 5),
                buildButtonTheme("Monitoria", 1, context),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                buildButtonTheme("Exercício", 2, context),
                SizedBox(width: 5),
                buildButtonTheme(" Material\nde estudo", 3, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<int> buildPopupMenuButton() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Perfil"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Configuração"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Sair"),
        ),
      ],
      onCanceled: () {
        print("You have canceled the menu.");
      },
      onSelected: (value) {
        if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Perfil(),
            ),
          );
        } else if (value == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Configurar(),
            ),
          );
        } else if (value == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      },
      icon: Icon(Icons.list),
    );
  }

  ButtonTheme buildButtonTheme(String text, int i, BuildContext context) {
    return ButtonTheme(
      minWidth: 180,
      height: 180,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: bordas[i].tl,
          topRight: bordas[i].tr,
          bottomLeft: bordas[i].bl,
          bottomRight: bordas[i].br,
        ),
      ),
      child: RaisedButton(
        color: Colors.cyan[890],
        splashColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => listaPagina[i],
            ),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
