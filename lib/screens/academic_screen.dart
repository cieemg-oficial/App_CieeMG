import 'package:flutter/material.dart';
import 'package:teste/screens/address_screen.dart';
import 'package:teste/tabs/home_tab.dart';


class AcademicScreen extends StatefulWidget {
  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Dados Acadêmicos"),
        centerTitle: true,),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Escola onde estuda ou estudou"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Curso"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Ano de formatura"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Semestre de formatura"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Mês da formatura"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Periodo/Ano/Ciclo/Módulo"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Horário de Estudo"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              SizedBox(
                height: 44.0,
                child: MaterialButton( 
                  child: Text("Finalizar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  HomeTab()
                  ));
                }),
              ),
               SizedBox(height: 16.0,),
              ]
          )
        )
      );        
  }
}