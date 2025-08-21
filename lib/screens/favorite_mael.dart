import 'package:flutter/material.dart';

class FavoriteMael extends StatelessWidget {
  const FavoriteMael({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Meal",
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color.fromARGB(255, 36, 73, 104),

        centerTitle: true,
      ),
      body: const Center(child: Text("Nothing To see")),
    );
  }
}
