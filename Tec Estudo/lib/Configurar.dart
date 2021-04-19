import 'package:flutter/material.dart';

import 'Perfil.dart';
import 'login.dart';

class Configurar extends StatefulWidget {
  @override
  _ConfigurarState createState() => _ConfigurarState();
}

class _ConfigurarState extends State<Configurar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                "Tec Estudo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Configuração",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        actions: [
          BuildPopupMenuButton(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.blue[800],
        margin: EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 40),
        child: Column(
          children: [
            Text("Trocar senha"),
            Text("Sobre o Tec Estudo"),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<int> BuildPopupMenuButton() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Perfil"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Sair"),
        ),
      ],
      initialValue: 2,
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
              builder: (context) => Login(),
            ),
          );
        }
      },
      icon: Icon(Icons.list),
    );
  }
}
