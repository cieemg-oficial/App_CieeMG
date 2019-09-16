import 'package:brasil_fields/formatter/cpf_input_formatter.dart';
import 'package:brasil_fields/formatter/data_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'address_screen.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 var selectedType;
 var maritalType;
 var physicalType;
 final _formKey = GlobalKey<FormState>();
 String _dropdownvalue = 'Sexo';
 
 List<String> _sexyType = <String> [
      'Masculino',
      'Feminino',
 ];
  var _maritalStatus = ['Solteiro(a)', 'Casado(a)', 'Amaziado(a)', 'Divorciado(a)', 'Viúvo(a)',];


 List<String> _physicalDisability = <String> [
      'Não',
      'Física',
      'Auditiva',
      'Visual',
      'Mental',
      'Múltipla',
 ];
 String dropdownValue = "one";

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Dados Básicos"),
        centerTitle: true,),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Nome Completo"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "CPF",
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "CPF Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "RG"
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Orgão Expedidor"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Carteira de Trabalho"
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nome do Pai"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nome da Mãe"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
                // Row(
                //     children: <Widget>[
                // SizedBox(height: 16.0,),
                new DropdownButtonFormField<String>(
                hint: Text("Sexo"),
                validator: (String value) {
                  if(value?.isEmpty ?? true) {
                    return 'Sexo Invalido';
                  }
                },
                decoration: InputDecoration(),
                items: _sexyType.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(value,
                    style: TextStyle(color: Colors.black),
                    ),
                    value: value,
                  );
                }).toList(),
                  onChanged: (selectedAccountType) {
                   setState(() {
                   selectedType = selectedAccountType;
                  });
                },
                value: selectedType,
              ),
              SizedBox(height: 16.0,),
                new DropdownButtonFormField<String>(
                  hint: Text("Estado Civil"),
                  validator: (String value){
                    if(value?.isEmpty ?? true) {
                      return 'Estado Civil Invalido';
                    }
                  },
                  decoration: InputDecoration(),
                  items: _maritalStatus.map((value) {
                    return DropdownMenuItem<String> (
                      child: Text(value,
                      style: TextStyle(color: Colors.black),
                      ),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String selectedMaritalType) {
                    setState(() {
                     maritalType = selectedMaritalType;
                    });
                  },
                  value: maritalType,
                ),
              SizedBox(height: 16.0,),
               new DropdownButtonFormField<String>(
                 hint: Text("Possui Alguma Deficiência?"),
                 validator: (String value){
                   if(value?.isEmpty ?? true) {
                     return 'Selecione uma Opção';
                   }
                 },
                decoration: InputDecoration(),
                   items: _physicalDisability.map((value) { 
                    return DropdownMenuItem<String>(
                    child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                     ),
                      value: value,
                    );
                    }).toList(),
                      onChanged: (selectedPhysicalType) {
                      setState(() {
                      physicalType = selectedPhysicalType;
                    });
                },
                value: physicalType,
                ),
              SizedBox(height: 16.0,),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Data de Nascimento",
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Data de Nascimento não Informada";
                },
              ),
              SizedBox(height: 16.0,),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                child: Text("Avançar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: (){
                  if (!_formKey.currentState.validate()) {
                    
                  }else(
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  AddressScreen()
                  )));
                },
              ),
              ),
              SizedBox(height: 16.0,),
            ],
          ),
        ),
    );     
}
}  