import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange[300],
      ),
      home: SearchScreen(),
    );
  }
}