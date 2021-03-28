import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/helpers/colors.dart';
import 'package:lidlomiks/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lidlomiks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: createMaterialColor(kPrimaryColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Dancing',
            fontWeight: FontWeight.bold,
            fontSize: 52,
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}

