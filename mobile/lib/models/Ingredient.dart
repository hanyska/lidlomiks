class Ingredient {
  String name;
  int amount;
  String measure;

  Ingredient({
    this.name,
    this.amount,
    this.measure
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'amount': amount,
    'measure': measure,
  };

  factory Ingredient.fromJson(Map<String, dynamic> json) => new Ingredient(
    amount: json['amount'],
    measure: json['measure'],
    name: json['name'],
  );

  static List<Ingredient> fromJsonToList(dynamic json) => List<Ingredient>
    .from((json as List)
    .map((i) => Ingredient.fromJson(i)))
    .toList();
}