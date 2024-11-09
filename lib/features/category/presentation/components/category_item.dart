import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String? discountedPrice;
  final String? originalPrice;
  final String imagePath;
  final double? rating;
  final double height;
  final bool isMinimal;

  const CategoryItem({
    super.key,
    required this.title,
    this.discountedPrice,
    this.originalPrice,
    required this.imagePath,
    this.rating,
    required this.height,
    this.isMinimal = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1200;
    bool isDesktop = width >= 1200;

    double itemHeight = height *
        (isDesktop
            ? 0.5
            : isTablet
                ? 0.6
                : 0.6);
    double itemWidth = isDesktop
        ? 150
        : isTablet
            ? 130
            : 113;

    return Container(
      width: itemWidth,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                top: 4,
                bottom: 4,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.39),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.elliptical(4, 12),
                        bottomLeft: Radius.elliptical(8, 12)),
                  ),
                ),
              ),
              Positioned(
                left: 4,
                right: 4,
                bottom: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(12, 12),
                    ),
                  ),
                ),
              ),
              Container(
                width: itemWidth,
                height: itemHeight,
                margin: const EdgeInsets.only(left: 4, bottom: 4),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Additional details conditionally displayed
          if (!isMinimal) ...[
            if (originalPrice != null && originalPrice!.isNotEmpty)
              Text(
                originalPrice!,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            if (discountedPrice != null && discountedPrice!.isNotEmpty)
              Text(
                discountedPrice!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 4),
            if (rating != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index < rating!.floor() ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 14,
                    );
                  }),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            const SizedBox(height: 6),
            if ((discountedPrice != null && discountedPrice!.isNotEmpty) ||
                (originalPrice != null && originalPrice!.isNotEmpty))
              SizedBox(
                height: 40, // Reduced height for button on smaller screens
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart, size: 16),
                  label:
                      const Text("Add to Cart", style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
