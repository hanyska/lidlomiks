import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lidlomiks/models/Recipe.dart';

class RecipeService {
  static FirebaseFirestore fb = FirebaseFirestore.instance;
  static CollectionReference recipesCollection = fb.collection('recipes');

  static Future<bool> addRecipe(Recipe recipe) {
    recipe.createDate = new DateTime.now();

    return recipesCollection
      .add(recipe.toJson())
      .then((_) => true)
      .catchError((_) => false);
  }

  static Future<dynamic> getMyRecipe() {
    return recipesCollection.doc().get().then((DocumentSnapshot snapshot) {
      print(snapshot.data);
    });
  }
}