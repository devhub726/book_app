import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dashboard_controller.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imgSlide;
  final double height;

  const ImageSlider({super.key, required this.imgSlide, required this.height});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Obx(() {
      return Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: imgSlide.length,
          onPageChanged: (index) {
            controller.currentPage.value = index;
          },
          itemBuilder: (context, index) {
            return ClipRRect(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 18 / 9,
                  child: Image.asset(
                    imgSlide[index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: height,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
