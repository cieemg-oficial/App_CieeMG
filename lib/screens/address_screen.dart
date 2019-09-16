import 'package:brasil_fields/formatter/cep_input_formatter.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/screens/academic_screen.dart';
import 'package:teste/screens/signup_screen.dart';
import 'package:teste/src/via_cep.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
final _formKey = GlobalKey<FormState>();

bool digito_9;



 @override
 Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Endereço"),
        centerTitle: true,),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
             SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "CEP",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Logradouro"
                ),
                // validator: (text){
                //   if(text.isEmpty) return "Logradouro Inválido";
                // },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Número"
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Número Inválido";
                },
              ),
               SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Complemento"
                ),
              ),
               SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "UF"
                ),
                validator: (text){
                  if(text.isEmpty) return "UF Inválido";
                },
              ),
               SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Bairro"
                ),
                validator: (text){
                  if(text.isEmpty) return "Bairro Inválido";
                },
              ),
               SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Cidade"
                ),
                validator: (text){
                  if(text.isEmpty) return "Cidade Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(digito_9: true,),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Telefone 1",
                ),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  new TelefoneInputFormatter(digito_9: true,),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Telefone 2",
                ),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "E-mail"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  bool isEmail(String em) {
                  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(p);
                  return regExp.hasMatch(em);
                  }
                  if(text.isEmpty || !text.contains("@")) return "E-mail Inválido";
                },
              ),
               SizedBox(height: 16.0,),
              SizedBox(
                height: 44.0,
                child: MaterialButton( 
                  child: Text("Avançar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: (){
                  if(!_formKey.currentState.validate()){

                  }else(
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  AcademicScreen()
                  )));
                }),
              ),
               SizedBox(height: 16.0,),
              ],
              )
              )
              );
  }}