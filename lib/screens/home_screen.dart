import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Lidlomiks',
                  style: TextStyle(
                    fontFamily: 'Dancing',
                    fontWeight: FontWeight.bold,
                    fontSize: 52
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset(
                  "assets/images/login.svg",
                  height: size.height * 0.4,
                ),
                RoundedButton(
                  text: "Zaloguj się".toUpperCase(),
                  onClicked: () => print('Login'),
                ),
                RoundedButton(
                  text: "Zarejestruj się".toUpperCase(),
                  color: kLightGrey,
                  onClicked: () => print('Sing up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}