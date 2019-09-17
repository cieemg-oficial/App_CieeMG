import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:teste/models/user_model.dart';
import 'package:teste/screens/academic_screen.dart';
// import 'package:teste/screens/home_screen.dart';
import 'package:teste/src/via_cep.dart';
import 'package:teste/tabs/home_tab.dart';

// import 'package:teste/screens/signup_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

@override
Widget build(BuildContext context) {
  return ScopedModel<UserModel>(
    model: UserModel(),
    child: MaterialApp(
    title: 'Tela de Cadastro',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: ViaCep(),
      )  
    );
  }
}

