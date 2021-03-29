import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lidlomiks/components/progress_bar.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/components/toast.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/helpers/firebase_service.dart';
import 'package:lidlomiks/screens/register_screen.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void _login() async {
    ProgressBar().show();
    UserCredential userCredential;

    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (error) {
      String errorMessage = FirebaseService.getMessageFromErrorCode(error.code);
      Toaster.show(errorMessage, toasterType: ToasterType.DANGER, isLongLength: true);
    }

    ProgressBar().hide();
    if (userCredential.user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen(), ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Zaloguj się',
                style: Theme.of(context).textTheme.headline1,
              ),
              SvgPicture.asset(
                "assets/images/login.svg",
                height: size.height * 0.4,
              ),
              RoundedInput(
                controller: _emailController,
                icon: Icon(Icons.email, color: kPrimaryColor),
                hintText: 'Twój email',
              ),
              RoundedInput(
                controller: _passwordController,
                icon: Icon(Icons.lock, color: kPrimaryColor),
                hintText: 'Hasło',
                isPassword: true,
              ),
              RoundedButton(
                text: "Zaloguj się".toUpperCase(),
                onClicked: _login
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nie masz konta?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    ),
                    child: Text(
                      'Zarejestruj się',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
