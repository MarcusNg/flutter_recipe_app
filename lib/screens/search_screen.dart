import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/meal_plan_model.dart';
import 'package:flutter_recipe_app/screens/meals_screen.dart';
import 'package:flutter_recipe_app/services/api_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _diets = [
    'None',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Whole30',
  ];

  double _targetCalories = 2250;
  String _diet = 'None';

  Future<void> _searchMealPlan() async {
    try {
      MealPlan mealPlan = await APIService.instance.generateMealPlan(
        targetCalories: _targetCalories.toInt(),
        diet: _diet,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MealsScreen(mealPlan: mealPlan),
        ),
      );
    } catch (error) {
      // Handle error here
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.imgur.com/9juGDyq.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Paano Kaon: Meal Planner',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 29),
                    children: [
                      TextSpan(
                        text: _targetCalories.truncate().toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' calories',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Slider(
                  min: 0.0,
                  max: 4500.0,
                  value: _targetCalories,
                  onChanged: (value) => setState(() {
                    _targetCalories = value.round().toDouble();
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButtonFormField<String>(
                    items: _diets.map((String priority) {
                      return DropdownMenuItem<String>(
                        value: priority,
                        child: Text(
                          priority,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Diet',
                      labelStyle: TextStyle(fontSize: 18.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _diet = value!;
                      });
                    },
                    value: _diet,
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 8.0,
                    ),
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: _searchMealPlan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
