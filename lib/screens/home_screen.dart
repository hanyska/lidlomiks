import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/screens/login_screen.dart';

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
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset(
                  "assets/images/home.svg",
                  height: size.height * 0.4,
                ),
                RoundedButton(
                  text: "Zaloguj się".toUpperCase(),
                  onClicked: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  )
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