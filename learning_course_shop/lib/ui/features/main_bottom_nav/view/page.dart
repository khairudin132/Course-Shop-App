import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/ui/features/home/view/screen/home_screen.dart';
import 'package:learning_course_shop/ui/features/main_bottom_nav/controller/notifier/notifier.dart';
import 'package:learning_course_shop/ui/features/search/page.dart';
import 'package:learning_course_shop/ui/ui.dart';

class MainBottomNavScreen extends ConsumerWidget {
  const MainBottomNavScreen({super.key});

  static const path = '/MainBottomNavScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexNotifier);

    return PageBase(
      hasBodyPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => ref.read(currentIndexNotifier.notifier).state = index,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(AppIconsAdaptive.home),
            activeIcon: Icon(AppIconsAdaptive.homeFilled),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(AppIconsAdaptive.search),
            activeIcon: Icon(AppIconsAdaptive.searchFilled),
          ),
          const BottomNavigationBarItem(
            label: 'Profile',
            icon: CircleAvatar(
              radius: 15,
            ),
            // activeIcon: Icon(AppIconsAdaptive.profileFilled),
          ),
        ],
      ),
      child: _listOfScreens[currentIndex],
    );
  }
}

final _listOfScreens = [
  const HomeScreen(),
  const SearchScreen(),
  const ProfileScreen(),
];
