import 'package:flutter/material.dart';
import 'package:teste/screens/home_screen.dart';
// import 'package:teste/screens/signup_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Tela de Cadastro',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  );
}

}

