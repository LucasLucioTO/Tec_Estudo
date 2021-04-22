import 'package:flutter/material.dart';



class Borda {
  final Radius tl;
  final Radius tr;
  final Radius bl;
  final Radius br;
  
  const Borda({
    this.tl,
    this.tr,
    this.bl,
    this.br,
  });
}

const List<Borda> bordas = const <Borda>[
  Borda(
    tl: Radius.circular(30),
    tr: Radius.circular(0),
    bl: Radius.circular(0),
    br: Radius.circular(0),
  ),
  Borda(
    tl: Radius.circular(0),
    tr: Radius.circular(30),
    bl: Radius.circular(0),
    br: Radius.circular(0),
  ),
  Borda(
    tl: Radius.circular(0),
    tr: Radius.circular(0),
    bl: Radius.circular(30),
    br: Radius.circular(0),
  ),
  Borda(
    tl: Radius.circular(0),
    tr: Radius.circular(0),
    bl: Radius.circular(0),
    br: Radius.circular(30),
  ),
];
