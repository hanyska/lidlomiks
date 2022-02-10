import 'package:flutter/material.dart';
import 'package:lidlomiks/components/rounded_dropdown.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/models/Ingredient.dart';

class IngredientTextFields extends StatefulWidget {
  final int index;
  final List<Ingredient> list;

  IngredientTextFields({
    this.index,
    this.list
  });

  @override
  _IngredientTextFieldsState createState() => _IngredientTextFieldsState();
}

class _IngredientTextFieldsState extends State<IngredientTextFields> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _measureController = TextEditingController();

  @override
  void initState() {
    _measureController.text = kMeasures[0];
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = widget.list[widget.index].name ?? '';
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: RoundedInput(
                controller: _amountController,
                inputType: InputType.NUMBER,
                hintText: 'Ilość',
                isRequired: true,
                onChanged: (v) => widget.list[widget.index].amount = int.parse(v),
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              flex: 2,
              child: RoundedDropdown(
                controller: _measureController,
                items: kMeasures,
                onChanged: (v) {
                  setState(() => _measureController.text = v);
                  widget.list[widget.index].measure = v.toString();
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RoundedInput(
                controller: _nameController,
                inputType: InputType.TEXT,
                hintText: 'Składnik',
                isRequired: true,
                onChanged: (v) => widget.list[widget.index].name = v,
              ),
            ),
          ],
        ),
      ],
    );
  }
}