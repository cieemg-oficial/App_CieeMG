import 'package:flutter/material.dart';
import 'package:teste/screens/address_screen.dart';
import 'package:teste/tabs/home_tab.dart';


class AcademicScreen extends StatefulWidget {
  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  var semesterType;
  var scheduleType;
  var periodtype;
  final _formKey = GlobalKey<FormState>();

  List<String> _schoolSemester = <String> [
    '1', 
    '2',
    'Estágio Curricular',
  ];
  List<String> _studySchedule = <String> [
    'Manhã',
    'Tarde',
    'Noite',
    'Estágio Curricular',
    'EAD',
    'Formado',
  ];
  List<String> _pediodSchool = <String> [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', 'Estágio Curricular',
  ];


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
                maxLength: 4,
                decoration: new InputDecoration(
                  hintText: "Ano de formatura"
                ),
                keyboardType: TextInputType.number,
                validator: (text){
                  if(text.isEmpty) return "Nome Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              new DropdownButtonFormField<String>(
                hint: Text("Semestre de Formatura"),
                validator: (String value){
                  if(value?.isEmpty ?? true) {
                    return 'Semestre é Obrigatorio';
                  }
                },
                decoration: InputDecoration(),
                items: _schoolSemester.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (selectSemesterType) {
                  setState(() {
                   semesterType = selectSemesterType; 
                  });
                },
                value: semesterType,
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Mês da formatura"
                ),
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.length == 0 || double.parse(value) >= 13 || double.parse(value) <= 0) return "Mês Inválido";
                },
              ),
              SizedBox(height: 16.0,),
              new DropdownButtonFormField<String>(
                hint: Text("Periodo/Ano/Ciclo/Módulo"),
                validator: (String value) {
                  if(value?.isEmpty ?? true) {
                    return 'Periodo é Obrigatorio';
                  }
                },
                decoration: InputDecoration(),
                items: _pediodSchool.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (selectPeriodType) {
                  setState(() {
                   periodtype = selectPeriodType; 
                  });
                },
                value: periodtype,
              ),
              SizedBox(height: 16.0,),
              new DropdownButtonFormField<String>(
                hint: Text("Horário de Estudo"),
                validator: (String value){
                  if(value?.isEmpty ?? true) {
                    return 'Horário Obrigatorio';
                  }
                },
                decoration: InputDecoration(),
                items: _studySchedule.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (selectScheduleType){
                  setState(() {
                   scheduleType = selectScheduleType; 
                  });
                },
                value: scheduleType,
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
                  if(!_formKey.currentState.validate()) {

                  }else(
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    HomeTab()

                  )));
                }),
              ),
               SizedBox(height: 16.0,),
              ]
          )
        )
      );        
  }
}