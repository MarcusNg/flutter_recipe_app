class Meal {
  final int id;
  final String title;
  final String imageUrl;

  Meal({
    this.id,
    this.title,
    this.imageUrl,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      imageUrl: 'https://spoonacular.com/recipeImages/' + map['image'],
    );
  }
}
