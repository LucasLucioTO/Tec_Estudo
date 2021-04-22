import 'package:flutter/material.dart';

import 'Configurar.dart';
import 'Perfil.dart';
import 'login.dart';

class Monitoria extends StatefulWidget {
  @override
  _MonitoriaState createState() => _MonitoriaState();
}

class _MonitoriaState extends State<Monitoria> {
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
                "Monitoria",
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
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return BuildCard("${index + 1}");
            }),
      ),
    );
  }

  Card BuildCard(String numb) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Text(
                numb,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              color: Colors.grey[800],
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Professor " + numb,
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[600],
              ),
            ),
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
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
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
}
