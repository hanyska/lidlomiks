import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/helpers/colors.dart';
import 'package:lidlomiks/screens/dashboard_screen.dart';
import 'package:lidlomiks/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'helpers/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: 'Lidlomiks',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
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
      home: firebaseUser != null ? DashboardScreen() : HomeScreen(),
    );
  }
}

