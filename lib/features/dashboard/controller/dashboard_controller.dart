import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../entities/book.dart';

class DashboardController extends GetxController {
  final PageController pageController = PageController();

  var searchQuery = ''.obs;
  final currentPage = 0.obs;
  final top_cat = "Top Categories".obs;
  final latest_book = "latest Books".obs;
  var books = <Book>[].obs;
  var imgList = <String>[].obs;
  var imgSlide = <String>[].obs;
  var notifications_no = 99.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
    fetchImages();
    imageSlide();
    startAutoSlide();
  }

  void fetchBooks() async {
    await Future.delayed(Duration(seconds: 2));
    books.value = [
      Book(name: "Financial Intelligence", image: "assets/images/book-1.png"),
      Book(name: "Blue Ocean Strategy", image: "assets/images/book-2.png"),
      Book(name: "Playing to Win", image: "assets/images/book-3.png"),
      Book(name: "The Outsiders", image: "assets/images/book-4.png"),
      Book(
          name: "Competing in the Age of AI",
          image: "assets/images/book-5.png"),
      Book(name: "Financial Intelligence", image: "assets/images/book-1.png"),
      Book(name: "Blue Ocean Strategy", image: "assets/images/book-2.png"),
      Book(name: "Playing to Win", image: "assets/images/book-3.png"),
      Book(name: "The Outsiders", image: "assets/images/book-4.png"),
      Book(
          name: "Competing in the Age of AI",
          image: "assets/images/book-5.png"),
    ];
  }

  void fetchImages() async {
    await Future.delayed(const Duration(seconds: 2));
    imgList.value = [
      'assets/images/poster-1.jpg',
      'assets/images/poster-2.jpg',
      'assets/images/poster-1.jpg',
      'assets/images/poster-2.jpg',
    ];
  }

  void imageSlide() {
    imgSlide.value = [
      'assets/images/poster-1.jpg',
      'assets/images/poster-2.jpg',
      'assets/images/poster-1.jpg',
      'assets/images/poster-2.jpg',
    ];
  }

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      int nextPage = (currentPage.value + 1) % imgList.length;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      currentPage.value = nextPage;
    });
  }
}
