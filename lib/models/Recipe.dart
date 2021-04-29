import 'package:lidlomiks/models/Ingredient.dart';
import 'package:lidlomiks/providers/firebase_service.dart';

class Recipe {
  String userId;
  final String name;
  final List<Ingredient> ingredients;
  final String tips;
  final String recipe;
  final String imagePath;
  DateTime createDate;

  Recipe({
    this.userId,
    this.name,
    this.ingredients,
    this.tips,
    this.recipe,
    this.imagePath,
    this.createDate
  });

  set setCreateDate(DateTime dateTime) {
    createDate = dateTime;
  }

  Map<String, dynamic> toJson() =>
    {
      'userId': FirebaseService.userId,
      'name': name,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'tips': tips,
      'recipe': recipe,
      'imagePath': imagePath,
      'createDate': createDate.toIso8601String(),
    };
}