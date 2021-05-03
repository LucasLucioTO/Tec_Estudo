

import 'package:flutter/material.dart';

import 'Configurar.dart';
import 'login.dart';
import 'map.page.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
            "Perfil",
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
            Text("Nome do aluno"),
            Text("E-mail"),
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
          child: Text("Configurações"),
        ),
    PopupMenuItem(
          value: 2,
          child: Text("Sair"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Mapa"),
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
              builder: (context) => Configurar(),
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
          else if (value == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapPage(),
            ),
          );
        }
        },
      icon: Icon(Icons.list),
    );
  }
}
