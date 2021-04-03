import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';


Widget myAppBar({BuildContext context, String title, PreferredSizeWidget bottom, List<Widget> actions, double elevation}) {
  return AppBar(
      elevation: elevation ?? 4.0,
      iconTheme: IconThemeData(color: kWhite),
      backgroundColor: kPrimaryColor,
      title: Text(
        title,
        style: TextStyle(color: kWhite),
      ),
      bottom: bottom,
      actions: actions
  );
}