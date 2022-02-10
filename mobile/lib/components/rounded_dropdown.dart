import 'package:flutter/material.dart';
import 'package:lidlomiks/components/rounded_wrapper.dart';
import 'package:lidlomiks/constants.dart';

class RoundedDropdown extends StatefulWidget {
  final TextEditingController controller;
  final List<dynamic> items;
  final Function onChanged;

  RoundedDropdown({
    this.controller,
    this.items,
    this.onChanged
  });

  @override
  _RoundedDropdownState createState() => _RoundedDropdownState();
}


class _RoundedDropdownState extends State<RoundedDropdown> {
  DropdownMenuItem<String> onlyTextWidget(dynamic value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 14.0, color: kGrey)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundedWrapper(
      child: DropdownButton(
        underline: DropdownButtonHideUnderline(child: Container()),
        hint: Text('AA'),
        iconEnabledColor: kLightGrey,
        iconDisabledColor: kGrey,
        value: widget.controller.text,
        onChanged: widget.onChanged,
        isExpanded: true,
        items: widget.items.map((value) => onlyTextWidget(value)).toList(),
      )
    );
  }
}
