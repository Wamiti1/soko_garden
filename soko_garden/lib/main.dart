import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:soko_garden/screens/authentication/authentication.dart';
import './screens/input.dart';

void main() {
  runApp(MaterialApp(
    title: 'Leave App',
    debugShowCheckedModeBanner: false,    
    theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue,),
    darkTheme: FlexThemeData.dark(scheme: FlexScheme.hippieBlue, darkIsTrueBlack: true),
    home:  const Authentication(),
  ));
}


