import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/search_bar_widget.dart';
import '../../../category/presentation/components/category_list_view.dart';
import '../../controller/dashboard_controller.dart';
import '../components/book_title.dart';
import '../components/image_slider.dart';

class Dashboard extends StatelessWidget {
  final searchController = TextEditingController();

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            bool isTablet = width >= 600 && width < 1200;
            bool isDesktop = width >= 1200;

            double sliderHeight = isTablet ? 300 : (isDesktop ? 500 : 200);
            double bookListHeight = isTablet ? 300 : (isDesktop ? 400 : 250);
            double titleFontSize = isDesktop ? 32 : (isTablet ? 28 : 24);

            return Column(
              children: [
                SearchBarWidget(
                  searchController: searchController,
                  onChanged: controller.searchQuery.call,
                  onTap: () {},
                  icon: Icons.notifications_none,
                  notificationsNumber: controller.notifications_no,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageSlider(
                          imgSlide: controller.imgSlide,
                          height: sliderHeight,
                        ),
                        BookTitle(
                            title: controller.top_cat.value,
                            fontSize: titleFontSize),
                        CategoryListView(
                          books: controller.books,
                          height: bookListHeight,
                          isMinimal: true,
                        ),
                        BookTitle(
                            title: controller.latest_book.value,
                            fontSize: titleFontSize),
                        CategoryListView(
                          books: controller.books,
                          height: bookListHeight,
                          isMinimal: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
