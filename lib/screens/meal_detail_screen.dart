import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(meal.title)));
  }
}
