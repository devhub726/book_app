import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../entities/book.dart';
import 'category_item.dart';

class CategoryListView extends StatelessWidget {
  final RxList<Book> books;
  final double height;
  final bool isMinimal;

  const CategoryListView({
    super.key,
    required this.books,
    required this.height,
    required this.isMinimal,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1200;
    bool isDesktop = width >= 1200;
    return SizedBox(
      // height: height * (isMinimal ? 0.8 : 0.9),
      height: height *
          (isDesktop
              ? isMinimal
                  ? 0.7
                  : 0.9
              : isTablet
                  ? isMinimal
                      ? 0.8
                      : 1.2
                  : isMinimal
                      ? 0.8
                      : 1.3),
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return CategoryItem(
                title: book.name,
                discountedPrice: book.discountedPrice?.toString(),
                originalPrice: book.originalPrice?.toString(),
                imagePath: book.image,
                rating: book.rating,
                height: height,
                isMinimal: isMinimal,
              );
            },
          )),
    );
  }
}
