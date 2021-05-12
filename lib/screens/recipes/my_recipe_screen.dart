import 'package:flutter/material.dart';
import 'package:lidlomiks/models/Recipe.dart';
import 'package:lidlomiks/providers/recipe_service.dart';

class MyRecipeScreen extends StatefulWidget {
  @override
  _MyRecipeScreenState createState() => _MyRecipeScreenState();
}

class _MyRecipeScreenState extends State<MyRecipeScreen> {
  bool _waitForApi = false;
  List<Recipe> _recipes;

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  void getRecipes() {
    _waitForApi = true;

    RecipeService.getMyRecipe()
      .then((List<Recipe> recipes) => _recipes = recipes)
      .then((value) => _waitForApi = false);
  }

  @override
  Widget build(BuildContext context) {
    return _waitForApi ? CircularProgressIndicator() : ListView.builder(
      itemCount: _recipes.length,
      itemBuilder: (BuildContext context, int index) => _recipe(_recipes[index])
    );
  }

  Widget _recipe(Recipe recipe) {
    return GestureDetector(
        child: Card(
            elevation: 20.0,
            child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Text(recipe.name)])
            ])));
  }
}
