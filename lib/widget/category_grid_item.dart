import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/data/dummy_data.dart';
import 'package:rebuild_meal_app/model/models.dart';
import 'package:rebuild_meal_app/screens/meals_secreen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final filteredmeal = dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                MealsSecreen(category: category, meal: filteredmeal),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 9),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [category.color, category.color.withOpacity(0.80)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(category.title),
          ),
        ),
      ),
    );
  }
}
