import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/images/login.svg",
                height: size.height * 0.4,
              ),
              RoundedInput(
                icon: Icon(Icons.person, color: kPrimaryColor),
                hintText: 'Twój email',
              ),
              RoundedInput(
                icon: Icon(Icons.lock, color: kPrimaryColor),
                hintText: 'Hasło',
                isPassword: true,
              ),
              RoundedButton(
                text: "Zaloguj się".toUpperCase(),
                onClicked: () => print('Login'),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nie masz konta?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => print('Go to register page'),
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
