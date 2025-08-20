import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/model/models.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, this.category});
  final Category? category;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
