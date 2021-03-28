import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Zarejestruj się',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SvgPicture.asset(
                  "assets/images/register.svg",
                  height: size.height * 0.4,
                ),
                RoundedInput(
                  icon: Icon(Icons.person, color: kPrimaryColor),
                  hintText: 'Nick',
                ),
                RoundedInput(
                  icon: Icon(Icons.email, color: kPrimaryColor),
                  hintText: 'Twój email',
                ),
                RoundedInput(
                  icon: Icon(Icons.lock, color: kPrimaryColor),
                  hintText: 'Hasło',
                  isPassword: true,
                ),
                RoundedInput(
                  icon: Icon(Icons.lock, color: kPrimaryColor),
                  hintText: 'Powtórz hasło',
                  isPassword: true,
                ),
                RoundedButton(
                  text: "Zarejestruj się".toUpperCase(),
                  onClicked: () => print('Login'),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Masz już konto?'),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      child: Text(
                        'Zaloguj się',
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
