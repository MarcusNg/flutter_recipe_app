class Meal {
  final int id;
  final String title;
  final String imageUrl;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      imageUrl: 'https://spoonacular.com/recipeImages/' + map['image'],
    );
  }
}
