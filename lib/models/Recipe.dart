import 'package:lidlomiks/helpers/date_time_helper.dart';
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

  factory Recipe.fromJson(Map<String, dynamic> json) => new Recipe(
    userId: json['userId'],
    name: json['name'],
    ingredients: Ingredient.fromJsonToList(json['ingredients']),
    tips: json['tips'],
    recipe: json['recipe'],
    imagePath: json['imagePath'],
    createDate: DateTimeHelper.toDateTime(json['createDate']),
  );

  static List<Recipe> fromJsonToList(dynamic json) => List<Recipe>
    .from((json as List)
    .map((i) => Recipe.fromJson(i.data())))
    .toList();
}