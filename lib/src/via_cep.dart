import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCep extends StatefulWidget {
  @override
  _ViaCepState createState() => _ViaCepState();
}

class _ViaCepState extends State<ViaCep> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  _preencherCep() async {

  String cepDigitado = _controllerCep.text;
  String url = "https://viacep.com.br/ws/${cepDigitado}/json/unicode/";
  http.Response response;
  response = await http.get(url);
  Map<String, dynamic> retorno = json.decode(response.body);
  String logradouro = retorno["logradouro"];
  String bairro = retorno["bairro"];
  String localidade = retorno["localidade"];
  String uf = retorno["uf"];

 setState(() {
  _resultado = "${logradouro}, ${bairro}, ${localidade}, ${uf}"; 
 });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Consumo de Serviço web"),
        ) ,
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Text(_resultado),
              RaisedButton(
                child: Text("Clique aqui"),
                onPressed: _preencherCep,
              )
            ],
          ),
        ),
      
    );
  }
}


