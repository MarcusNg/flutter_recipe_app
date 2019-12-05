class Recipe {
  final String spoonacularSourceUrl;
  // Equipment
  // Ingredients
  // Steps
  // etc.

  Recipe({
    this.spoonacularSourceUrl,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      spoonacularSourceUrl: map['spoonacularSourceUrl'],
    );
  }
}
