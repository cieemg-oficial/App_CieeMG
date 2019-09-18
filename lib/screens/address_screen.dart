import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/screens/academic_screen.dart';
import 'package:teste/screens/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:validators/validators.dart';


class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
final _formKey = GlobalKey<FormState>();
var passKey = GlobalKey<FormFieldState>();


bool digito_9;

  TextEditingController controllerCep = TextEditingController();
  final myController = TextEditingController();
  String resultado = "Resultado";
  String resultadoLogradouro = "Logradouro";
  String resultadoBairro = "Bairro";
  String resultadoLocalidade = "Cidade";
  String resultadoUf = "UF";

  _preencherCep() async {

  String cepDigitado = controllerCep.text;
  String url = "https://viacep.com.br/ws/"+ cepDigitado +"/json/";
  http.Response response;
  response = await http.get(url);
  Map<String, dynamic> retorno = json.decode(response.body);
  String logradouro = retorno["logradouro"];
  String bairro = retorno["bairro"];
  String localidade = retorno["localidade"];
  String uf = retorno["uf"];

 setState(() {
  resultadoLogradouro = "$logradouro";
  resultadoBairro = "$bairro";
  resultadoLocalidade = "$localidade";
  resultadoUf = "$uf";
 });
}

  @override
  void initState(){
    super.initState();

    controllerCep.addListener(_printLatestValue);
  }
  @override
  void dispose(){
    controllerCep.dispose();
    super.dispose();
  }

  _printLatestValue(){
    print("$_preencherCep");
  }

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
                maxLength: 8,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  hintText: "CEP",
                  filled: false,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey, size: 28.0,),
                    onPressed: () async{
                      return await  _preencherCep();
                    },
                  )
                ),
                keyboardType: TextInputType.number,
                controller: controllerCep,
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoLogradouro, style: TextStyle(fontSize: 16, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                )]
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Número"
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Número é Obrigatorio";
                },
              ),
               SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Complemento"
                ),
              ),
               SizedBox(height: 16.0,),
                 Column(children: <Widget>[
                Align(
              child: Text(resultadoBairro, style: TextStyle(fontSize: 16, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 )
               ]
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoLocalidade, style: TextStyle(fontSize: 16, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 )
               ]
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoUf, style: TextStyle(fontSize: 16, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 ),
               ]
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Telefone",
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  new TelefoneInputFormatter(digito_9: true,),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Celular",
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "E-mail"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty || !text.contains("@")) return "E-mail Inválido";
                },
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                key: passKey,
                maxLength: 12,
                decoration: new InputDecoration(
                  hintText: "Senha",
                ),
                obscureText: true,
                validator: (password) {
                  var result = password.length < 8 ? "Senha tem que possuir de 8 a 12 Caracteres" : null;
                  return result;
                  // if(password.length < 8 || password.isEmpty) return "Senha Inválida";
                },
              ),
               SizedBox(height: 16.0,),
               TextFormField(
                 maxLength: 12,
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: "Confirmar Senha"
                 ),
                 validator: (cofirmation) {
                   var password = passKey.currentState.value;
                   return equals(cofirmation, password) ? null : "Senha Diferente";
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