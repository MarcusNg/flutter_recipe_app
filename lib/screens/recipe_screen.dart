import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/recipe_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeScreen extends StatefulWidget {
  final String mealType;
  final Recipe recipe;

  RecipeScreen({this.mealType, this.recipe});
  
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType),
      ),
      body: WebView(
        initialUrl: widget.recipe.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
