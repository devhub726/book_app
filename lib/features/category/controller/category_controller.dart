import 'package:get/get.dart';

import '../../../entities/book.dart';

class CategoryController extends GetxController {
  var isMahagyanExpanded = true.obs;
  var isVaidikExpanded = true.obs;
  var mahagyane_Books_title = "महाग्य ज्ञान पुस्तकें".obs;
  var Vaidik_Books_Title = "वैदिक दर्शन".obs;
  var mahagyanBooks = <Book>[].obs;
  var vaidikBooks = <Book>[].obs;
  var searchQuery = ''.obs;
  RxInt notifications_no = 909.obs;

  @override
  void onInit() {
    super.onInit();
    fatchMahagyanBooks();
    fatchVaidikBooks();
  }

  void fatchMahagyanBooks() {
    mahagyanBooks.value = [
      Book(
        name: "The Alchemist",
        image: "assets/images/book-1.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Free",
        rating: 4.0,
      ),
      Book(
        name: "The Power of Your Subconscious Mind",
        image: "assets/images/book-2.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 4.5,
      ),
      Book(
        name: "Zero to One",
        image: "assets/images/book-3.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 3.5,
      ),
      Book(
        name: "Zero to One",
        image: "assets/images/book-4.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 2.0,
      ),
      Book(
        name: "Zero to One",
        image: "assets/images/book-5.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 1.0,
      ),
    ];
  }

  void fatchVaidikBooks() {
    vaidikBooks.value = [
      Book(
        name: "जीवनचरित्र",
        image: "assets/images/book-1.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Free",
        rating: 4.0,
      ),
      Book(
        name: "India: A History",
        image: "assets/images/book-2.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 4.5,
      ),
      Book(
        name: "The Great Indian Novel",
        image: "assets/images/book-3.png",
        originalPrice: "Rs. 1009",
        discountedPrice: "Rs. 499/-",
        rating: 3.7,
      ),
    ];
  }

  void toggleMahagyan() {
    isMahagyanExpanded.value = !isMahagyanExpanded.value;
  }

  void toggleVaidik() {
    isVaidikExpanded.value = !isVaidikExpanded.value;
  }
}
