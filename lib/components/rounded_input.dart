import 'package:flutter/material.dart';
import 'package:lidlomiks/components/rounded_wrapper.dart';

import '../constants.dart';

enum InputType { EMAIL, PASSWORD, TEXT }

class RoundedInput extends StatefulWidget {
  final TextEditingController controller;
  final InputType inputType;
  final String hintText;
  final Icon icon;
  final bool isRequired;

   RoundedInput({
    Key key,
    this.controller,
    this.inputType = InputType.TEXT,
    this.hintText,
    this.icon,
    this.isRequired = false,
  }): super(key: key);

  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  bool showPassword = false;

  @override
  void initState() {
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

  TextInputType get _textInputType {
    switch(widget.inputType) {
      case InputType.EMAIL:
        return TextInputType.emailAddress;
      case InputType.PASSWORD:
        return TextInputType.visiblePassword;
      case InputType.TEXT:
      default:
        return TextInputType.text;
    }
  }

  String _validator(String value) {
    if ((value == null || value.isEmpty) && widget.isRequired) {
      return 'Pole nie może być puste';
    }
    if (widget.inputType == InputType.EMAIL) {
      String regex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp pattern = RegExp(regex);
      if (!pattern.hasMatch(value)) {
        return 'Niepoprawny adres email';
      }
    }
    if (widget.inputType == InputType.PASSWORD) {
      if (value.length < 5) {
        return 'Hasło powinno mieć conajmniej 5 znaków';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedWrapper(
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.inputType == InputType.PASSWORD ? !showPassword : false,
        keyboardType: _textInputType,
        decoration: InputDecoration(
          icon: widget.icon,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.0, color: kGrey),
          border: InputBorder.none,
          suffixIcon: widget.inputType == InputType.PASSWORD ? passwordSuffixIcon : null,
        ),
        validator: _validator
      )
    );
  }
}
