import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lidlomiks/models/Recipe.dart';

class RecipeService {
  static FirebaseFirestore _fb = FirebaseFirestore.instance;
  static CollectionReference _recipesCollection = _fb.collection('recipes');

  static Future<bool> addRecipe(Recipe recipe) {
    recipe.createDate = new DateTime.now();

    return _recipesCollection
      .add(recipe.toJson())
      .then((_) => true)
      .catchError((_) => false);
  }

  static Future<List<Recipe>> getMyRecipe() {
    return _recipesCollection.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
      return Recipe.fromJsonToList(querySnapshot.docs);
    });
  }
}