import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
  return Center(
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Colors.grey[50],
            Colors.lightBlue[50],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      // color: Colors.white,
      child: Column(
        children: <Widget>[
          FlightImageAsset(),
          
          SizedBox(width: 200,),
          SizedBox(height: 44.0,
          child: RaisedButton(
            child: Text("Cadastre-se",
            style: TextStyle(fontSize: 18.0),
            ),
            textColor: Colors.black,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          )
          )
        ],
      ),
    ),
  );
  }}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("assets/logo.png",);
    Image image = Image(image: assetImage, width: 500.0, height:350.0,);
    return Container(child: image,);
  }
}
