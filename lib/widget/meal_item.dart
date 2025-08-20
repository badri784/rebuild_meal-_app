import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rebuild_meal_app/model/meal.dart';
import 'package:rebuild_meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.complexity,
    required this.affordability,
  });

  final Meal meal;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Callenging';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: meal.imageUrl,
              height: 250,
              width: double.infinity,

              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              color: Colors.black26,
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(216, 5, 38, 41),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 75,
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Icon(Icons.access_alarm),
                            const SizedBox(width: 5),
                            Text('${meal.duration.toString()} min'),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            // const SizedBox(width: 55),
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(complexityText),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              // const SizedBox(width: 50),
                              const Icon(Icons.paid),
                              const SizedBox(width: 5),
                              Text(affordabilityText),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
