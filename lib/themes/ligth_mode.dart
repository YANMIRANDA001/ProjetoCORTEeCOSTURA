import 'package:flutter/material.dart';
import 'package:projeto_vander/pages/sobre_page.dart';

ThemeData LightMode = ThemeData(
  colorScheme: ColorScheme.light(
  background:Color.fromARGB(255, 202, 202, 202),
  primary:  Color(0xFFBA55D3),
  secondary:  Color(0xFFDDA0DD),
  inversePrimary: Color.fromARGB(255, 0, 0, 0),));

final ThemeData lightMode = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  // Adicione outras propriedades de tema conforme necessário
);
