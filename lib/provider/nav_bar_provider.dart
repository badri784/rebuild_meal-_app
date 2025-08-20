import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarProvider extends StateNotifier<int> {
  NavBarProvider() : super(0);
  void selectsecreen(index) {
    state = index;
  }
}

final navBarPro = StateNotifierProvider<NavBarProvider, int>(
  (_) => NavBarProvider(),
);
