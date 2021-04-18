class Ingredient {
  String name;
  int amount;
  String measure;

  Ingredient({
    this.name,
    this.amount,
    this.measure
  });

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'amount': amount,
      'measure': measure,
    };
}