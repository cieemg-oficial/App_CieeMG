import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCep extends StatefulWidget {
  @override
  _ViaCepState createState() => _ViaCepState();
}

class _ViaCepState extends State<ViaCep> {
  final _formKey = GlobalKey<FormState>();

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
        appBar:AppBar(
          title: Text("Consumo de Serviço web"),
        ) ,
        body: Form(
          key: _formKey,
           child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                
                decoration: InputDecoration(
                  hintText: "Digite o Cep",
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey, size: 28.0,),
                    onPressed: (){
                      return _preencherCep();
                    },
                  )
                ),
                style: TextStyle(
                  fontSize: 20
                ),
                controller: controllerCep,
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoLogradouro, style: TextStyle(fontSize: 20, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                )]
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoBairro, style: TextStyle(fontSize: 20, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 )
               ]
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoLocalidade, style: TextStyle(fontSize: 20, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 )
               ]
              ),
              SizedBox(height: 16.0,),
              Column(children: <Widget>[
                Align(
              child: Text(resultadoUf, style: TextStyle(fontSize: 20, color: Colors.black,),),
              alignment: Alignment.centerLeft,
                 ),
               ]
              ),
              SizedBox(height: 16.0,),
            ],
          ),
        ),
    );
  }
}


