import 'package:book/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../features/category/presentation/pages/category_page.dart';
import '../features/dashboard/presentation/pages/dashboard.dart';
import '../features/favourite/presentation/pages/favourite_page.dart';

class BottomNavBar extends StatelessWidget {
  final _selectedIndex = 0.obs;

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: _selectedIndex.value,
              children: [
                Dashboard(),
                CategoryPage(),
                Container(),
                FavouritePage(),
                MenuPage(),
              ],
            ),
          ),
          bottomNavigationBar: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 405 ? 15 : 10,
                  vertical: screenWidth > 405 ? 6 : 4,
                ),
                child: GNav(
                  iconSize: screenWidth > 405 ? 35 : 28,
                  gap: screenWidth > 405 ? 8 : 4,
                  color: Theme.of(context).colorScheme.tertiary,
                  activeColor: Theme.of(context).colorScheme.surface,
                  tabBackgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.45),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth > 405 ? 20 : 10,
                    vertical: screenWidth > 405 ? 10 : 6,
                  ),
                  selectedIndex: _selectedIndex.value,
                  onTabChange: (index) {
                    _selectedIndex.value = index;
                  },
                  tabs: const [
                    GButton(icon: Icons.home),
                    GButton(icon: Icons.menu_book),
                    GButton(
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                    ),
                    GButton(icon: Icons.star),
                    GButton(icon: Icons.dehaze),
                  ],
                ),
              ),
              Positioned(
                bottom: screenWidth > 405 ? 10 : 5,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.black.withOpacity(0.3),
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/book-1.png',
                    width: screenWidth > 405 ? 50 : 40,
                    height: screenWidth > 405 ? 70 : 56,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
