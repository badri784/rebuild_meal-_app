import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/model/meal.dart';
import 'package:rebuild_meal_app/model/models.dart';
import 'package:rebuild_meal_app/widget/meal_item.dart';

class MealsSecreen extends StatelessWidget {
  const MealsSecreen({super.key, required this.category, required this.meal});
  final Category category;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color.fromARGB(255, 36, 73, 104),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: meal
              .map(
                (e) => MealItem(
                  complexity: e.complexity,
                  affordability: e.affordability,
                  meal: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
