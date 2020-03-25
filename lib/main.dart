import 'package:flutter/material.dart';
import 'package:ecoscope_app/services/authentication.dart';
import 'package:ecoscope_app/pages/root_page.dart';
// This main.dart contains the login page.
void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        title: 'Ecoscope',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: new RootPage(auth: new Auth()));
  }
  }