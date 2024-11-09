import 'package:book/components/search_bar_widget.dart';
import 'package:book/features/category/presentation/components/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';

class CategoryPage extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());
  final searchController = TextEditingController();

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isTablet = width >= 600 && width < 1200;
        bool isDesktop = width >= 1200;

        double bookListHeight = isTablet ? 300 : (isDesktop ? 400 : 250);
        double titleFontSize = isDesktop ? 32 : (isTablet ? 28 : 24);

        return Column(
          children: [
            SearchBarWidget(
              searchController: searchController,
              onTap: () {},
              icon: Icons.notifications_none,
              onChanged: controller.searchQuery.call,
              notificationsNumber: controller.notifications_no,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => _buildCategorySection(
                          controller.mahagyane_Books_title.value,
                          controller.isMahagyanExpanded.value,
                          controller.toggleMahagyan,
                          CategoryListView(
                            books: controller.mahagyanBooks,
                            height: bookListHeight,
                            isMinimal: false,
                          ),
                          context,
                        )),
                    const SizedBox(height: 5),
                    Obx(() => _buildCategorySection(
                          controller.Vaidik_Books_Title.value,
                          controller.isVaidikExpanded.value,
                          controller.toggleVaidik,
                          CategoryListView(
                            books: controller.vaidikBooks,
                            height: bookListHeight,
                            isMinimal: false,
                          ),
                          context,
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildCategorySection(String title, bool isExpanded,
      VoidCallback onToggle, Widget bookList, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.30),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
        ),
        if (isExpanded) bookList,
      ],
    );
  }
}
