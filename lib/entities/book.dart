class Book {
  final String name;
  final String image;
  final String? originalPrice;
  final String? discountedPrice;
  final double? rating;

  Book({
    required this.name,
    required this.image,
    this.originalPrice,
    this.discountedPrice,
    this.rating,
  });
}
