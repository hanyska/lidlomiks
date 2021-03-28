import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onClicked;
  final Color color;
  final Color textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.onClicked,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: onClicked,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}