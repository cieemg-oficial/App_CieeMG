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
              Row(
                  children: <Widget>[
                    DropdownButton(
                      items: _sexyType.map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                        value: value,
                        )).toList(),
                        onChanged: (selectedAccountType) {
                          setState(() {
                           selectedType = selectedAccountType; 
                          });
                        },
                        value: selectedType,
                        isExpanded: false,
                        hint: Text("Sexo"),
                     ),
                  ],
              ),
              SizedBox(height: 16.0,),
                DropdownButton<String>(

                  items: _maritalStatus.map((String dropDownStringItem) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),

                  onChanged: (String selectedMaritalType) {
                    setState(() {
                     maritalType = selectedMaritalType;
                    });
                  },
                  value: maritalType,
                  isExpanded: false,
                  hint: Text("Estado Civil"),
                ),
              SizedBox(height: 16.0,),
              Row(
                  children: <Widget>[
                    DropdownButton(
                      items: _physicalDisability.map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                        value: value,
                        )).toList(),
                        onChanged: (selectedPhysicalType) {
                          setState(() {
                           physicalType = selectedPhysicalType; 
                          });
                        },
                        value: physicalType,
                        isExpanded: false,
                        hint: Text("Possui Alguma Deficiência?"),
                     ),
                  ],
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
                  if(text.isEmpty) return "CPF Inválido";
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
                 Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context)=>AddressScreen())
                 );
                  // if(_formKey.currentState.validate()) {

                  // }
                
                },
              ),
              )
            ],
          ),
        ),
    );
      
}
}  