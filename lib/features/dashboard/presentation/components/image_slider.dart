import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_controller.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imgSlide;

  const ImageSlider({super.key, required this.imgSlide});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Obx(() {
      return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: imgSlide.length,
          onPageChanged: (index) {
            controller.currentPage.value = index;
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgSlide[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
