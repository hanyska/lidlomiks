import 'package:flutter/material.dart';
import 'package:lidlomiks/components/image_picker_widget.dart';
import 'package:lidlomiks/components/rounded_input.dart';
import 'package:lidlomiks/components/toast.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/models/Ingredient.dart';
import 'package:lidlomiks/models/Recipe.dart';
import 'package:lidlomiks/providers/recipe.dart';
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
  List<Ingredient> ingredients = [
    new Ingredient(amount: null, name: null, measure: null)
  ];


  Future<void> _saveForm() async {
    bool validate = _formKey.currentState.validate();
    if (!validate) {
      Toaster.show('Formularz zawiera błędy.', toasterType: ToasterType.DANGER);
      return;
    }

    Recipe newRecipe = new Recipe(
      name: _titleCtr.text,
      ingredients: ingredients,
      tips: _tipsCtr.text,
      recipe: _recipeCtr.text,
      imagePath: null
    );

    bool response = await RecipeService.addRecipe(newRecipe);

    if (response) {
      Navigator.of(context).pop();
      Toaster.show('Dodano przepis', toasterType: ToasterType.SUCCESS);
    } else {
      Toaster.show('Formularz zawiera błędy', toasterType: ToasterType.DANGER);
    }

  }

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
                  isRequired: false,
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
          onPressed: _saveForm,
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

    List<Widget> ingredientsTextFields = [];

    for (int i = 0; i < ingredients.length; i++) {
      bool canAdd = i == ingredients.length - 1;
      ingredientsTextFields.add(
          Row(
            children: [
              Expanded(
                child: IngredientTextFields(
                  list: ingredients,
                  index: i
                )
              ),
              InkWell(
                onTap: () => setState(() => canAdd
                    ? ingredients.add(new Ingredient(amount: null, name: null, measure: null))
                    : ingredients.removeAt(i)),
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: canAdd
                      ? Colors.green
                      : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    canAdd
                      ? Icons.add
                      : Icons.remove,
                    color: Colors.white
                  ),
                ),
              )
            ],
          )
      );
    }
    return ingredientsTextFields;
  }


}




