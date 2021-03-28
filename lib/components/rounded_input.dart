import 'package:flutter/material.dart';
import 'package:lidlomiks/components/rounded_wrapper.dart';

import '../constants.dart';

class RoundedInput extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final bool isPassword;

  RoundedInput({
    Key key,
    this.hintText,
    this.icon,
    this.isPassword = false,
  }): super(key: key);

  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  bool showPassword;

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }
  Widget get passwordSuffixIcon {
    return GestureDetector(
      child: Icon(
        showPassword
          ? Icons.visibility_off
          : Icons.visibility,
        color: kPrimaryColor
      ),
      onTap: () => setState(() => showPassword = !showPassword),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundedWrapper(
      child: TextField(
        obscureText: widget.isPassword ? !showPassword : false,
        decoration: InputDecoration(
          icon: widget.icon,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.0, color: kGrey),
          border: InputBorder.none,
          suffixIcon: widget.isPassword ? passwordSuffixIcon : null,
        ),
      )
    );
  }
}
