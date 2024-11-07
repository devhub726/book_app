
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../controller/dashboard_controller.dart';
import '../components/book_list.dart';
import '../components/book_title.dart';
import '../components/image_slider.dart';
import '../components/search_bar_widget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SearchBarWidget(
                searchController: TextEditingController(),
                onChanged: controller.searchQuery,
                onTap: () {},
                icon: Icons.notifications_none,
              ),
              // Wrap content in SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        // Image slider widget
                        ImageSlider(imgSlide: controller.imgSlide),
                        const BookTitle(title: "Top Categories"),
                        BooksList(books: controller.books),
                        const BookTitle(title: "Latest Books"),
                        BooksList(books: controller.books),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Stack(
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
                      icon: Icons.menu_book,
                      margin: EdgeInsets.only(right: 90)),
                  GButton(icon: Icons.star),
                  GButton(icon: Icons.menu),
                ],
              ),
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
          ),
        ),
      ),
    );
  }
}
