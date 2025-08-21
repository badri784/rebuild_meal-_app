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
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)));
      },
      child: isLandScape
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                  child: CachedNetworkImage(
                    imageUrl: meal.imageUrl,
                    height: 250,
                    width: 450,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.access_alarm),
                            const SizedBox(width: 8),
                            Text('${meal.duration} min'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 8),
                            Text(complexityText),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.paid),
                            const SizedBox(width: 8),
                            Text(affordabilityText),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: meal.imageUrl,
                      height: 250,
                      width: 423.4,
                      fit: BoxFit.cover,

                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    color: Colors.black26,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                const Icon(Icons.access_alarm),
                                const SizedBox(width: 5),
                                Text(
                                  '${meal.duration.toString()} min',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.work),
                                const SizedBox(width: 5),
                                Text(
                                  complexityText,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),

                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.paid),
                                  const SizedBox(width: 5),
                                  Text(
                                    affordabilityText,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
