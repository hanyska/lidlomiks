import 'package:flutter/material.dart';
import 'package:lidlomiks/components/image_picker_widget.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/screens/main/app_bar.dart';

import 'ingredients_text_fields.dart';

class NewRecipeScreen extends StatefulWidget {
  static const routeName = '/recipe/new';
  @override
  _NewRecipeScreenState createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleCtr = new TextEditingController();
  final TextEditingController _tipsCtr = new TextEditingController();
  final TextEditingController _recipeCtr = new TextEditingController();
  List<String> ingredients = [null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'Nowy przepis'
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Nazwa przepisu', textAlign: TextAlign.left),
                RoundedInput(
                  controller: _titleCtr,
                  inputType: InputType.TEXT,
                  hintText: 'Wprowadź nazwę przepisu',
                  isRequired: true,
                ),
                SizedBox(height: 20),
                Text('Składniki', textAlign: TextAlign.left),
                ...ingredientsListWidget(),
                SizedBox(height: 20),
                Text('Wskazówki', textAlign: TextAlign.left),
                RoundedInput(
                  controller: _tipsCtr,
                  inputType: InputType.TEXT,
                  hintText: 'Wskazówki',
                  isRequired: true,
                ),
                SizedBox(height: 20),
                Text('Przepis', textAlign: TextAlign.left),
                RoundedInput(
                  controller: _recipeCtr,
                  inputType: InputType.MULTILINE,
                  hintText: 'Przepis',
                  isRequired: true,
                ),
                SizedBox(height: 20),
                Text('Zdjęcie', textAlign: TextAlign.left),
                ImagePickerWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          color: kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          onPressed: (){},
          child: Text(
            'Dodaj'.toUpperCase(),
            style: TextStyle(
              color: kWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> ingredientsListWidget(){

    List<Widget> friendsTextFields = [];

    for (int i=0; i<ingredients.length; i++) {
      friendsTextFields.add(
          Row(
            children: [
              Expanded(child: IngredientTextFields(list: ingredients, index: i)),
              _addRemoveButton(i == ingredients.length - 1, i),
            ],
          )
      );
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: () => setState(() => add
        ? ingredients.add(null)
        : ingredients.removeAt(index)),
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
      ),
    );
  }


}




