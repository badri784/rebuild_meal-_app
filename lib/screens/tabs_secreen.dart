import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebuild_meal_app/screens/favorite_mael.dart';
import '../provider/nav_bar_provider.dart';
import 'category_secreen.dart';
// import 'package:rebuild_meal_app/widget/category_grid_item.dart';

class TabsSecreen extends ConsumerStatefulWidget {
  const TabsSecreen({super.key});

  @override
  ConsumerState<TabsSecreen> createState() => _TabsSecreenState();
}

class _TabsSecreenState extends ConsumerState<TabsSecreen> {
  @override
  Widget build(BuildContext context) {
    final currenindex = ref.watch(navBarPro);
    Widget activeSecreen = const CategorySecreen();
    if (currenindex == 1) {
      activeSecreen = const FavoriteMael();
    }

    return Scaffold(
      body: activeSecreen,
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
