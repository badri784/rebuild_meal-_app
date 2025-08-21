import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color.fromARGB(255, 36, 73, 104),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: meal.imageUrl,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
            ),
            const Text(
              "ingredients:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...meal.ingredients.asMap().entries.map(
              (e) => Card.outlined(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(meal.ingredients.toString()),
                      leading: CircleAvatar(child: Text('${e.key + 1}')),
                    ),
                  ],
                ),
              ),
            ),

            Card.outlined(
              child: Column(
                children: [
                  const Text(
                    'Steps:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ...meal.steps.asMap().entries.map(
                    (e) => Card.outlined(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(e.value),
                            leading: CircleAvatar(child: Text('${e.key + 1}')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
