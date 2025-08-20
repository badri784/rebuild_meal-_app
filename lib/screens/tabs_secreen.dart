import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebuild_meal_app/provider/nav_bar_provider.dart';
import 'package:rebuild_meal_app/screens/favorite_mael.dart';
import 'package:rebuild_meal_app/widget/category_grid_item.dart';

class TabsSecreen extends ConsumerWidget {
  TabsSecreen({super.key});

  final List<Widget> pages = [const CategoryGridItem(), const FavoriteMael()];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currenindex = ref.watch(navBarPro);
    return Scaffold(
      body: pages[currenindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.read(navBarPro.notifier).selectsecreen(index);
        },
        currentIndex: currenindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_sharp),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorites'),
        ],
      ),
    );
  }
}
