import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        GNav(
            gap: 8,
            iconSize: 30,
            backgroundColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.tertiary,
            activeColor: Theme.of(context).colorScheme.surface,
            tabs: const [
              GButton(icon: Icons.home),
              GButton(
                icon: Icons.book,
                margin: EdgeInsets.only(right: 90),
              ),
              GButton(icon: Icons.star),
              GButton(icon: Icons.menu),
            ]),
        Positioned(
          bottom: 15,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 50,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
              ),
              child: Image.asset(
                'assets/images/book-1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
