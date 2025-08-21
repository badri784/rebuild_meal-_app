import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebuild_meal_app/data/dummy_data.dart';
import 'package:rebuild_meal_app/widget/category_grid_item.dart';

class CategorySecreen extends ConsumerWidget {
  const CategorySecreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color.fromARGB(255, 36, 73, 104),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            childAspectRatio: 10 / 8,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(category: category),
          ],
        ),
      ),
    );
  }
}
