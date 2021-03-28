import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool _success;
  String _userEmail;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {

    UserCredential userCredential = await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    final User user = userCredential.user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() => _success = true);
    }
  }



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
                RoundedInput(
                  icon: Icon(Icons.lock, color: kPrimaryColor),
                  hintText: 'Powtórz hasło',
                  isPassword: true,
                ),
                RoundedButton(
                  text: "Zarejestruj się".toUpperCase(),
                  onClicked: _register
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
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(_success == null
                      ? ''
                      : (_success
                      ? 'Successfully registered ' + _userEmail
                      : 'Registration failed')),
                )
              ],
            ),
          ),
        )
    );
  }
}
