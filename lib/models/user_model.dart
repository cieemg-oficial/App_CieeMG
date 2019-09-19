import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:teste/src/api_service.dart';

class UserModel extends Model {

// ApiServiceAuth _auth = ApiServiceAuth.instance;
// ApiServiceUser apiServiceUser;

Map<String, dynamic> userData = Map();

  bool isLoading = false;

void singUp(Map<String, dynamic> userData, String pass, VoidCallback onSuccess, VoidCallback onFail) {
  isLoading = true;
  notifyListeners();

  // _auth.createUserWhithEmailAndPassword(
  //   email: userData["email"],
  //   password: pass
  // ).then((user){

  // }).catchError((e){

  // });
}

}