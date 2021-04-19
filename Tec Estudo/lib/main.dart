import 'package:flutter/material.dart';

import 'login.dart';

class Initial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

main() {
  runApp(Initial());
}
