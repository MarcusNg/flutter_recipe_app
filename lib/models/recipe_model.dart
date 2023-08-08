class Recipe {
  final String spoonacularSourceUrl;
  // Equipment
  // Ingredients
  // Steps
  // etc. this is optional here

  Recipe({
    required this.spoonacularSourceUrl,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      spoonacularSourceUrl: map['spoonacularSourceUrl'],
    );
  }
}
