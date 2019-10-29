import 'package:flutter/material.dart';
import 'bmi.dart';
void main(){
  runApp(new MaterialApp(
    title:"BMI CALCULATOR",
    home:bmical(),
   theme: new ThemeData(
     primarySwatch: Colors.pink
   ),
  ));
}