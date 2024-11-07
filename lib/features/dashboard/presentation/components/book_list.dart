import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../entities/book.dart';

class BooksList extends StatelessWidget {
  final List<Book> books;

  const BooksList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          padding: const EdgeInsets.only(left: 10),
          itemBuilder: (context, index) {
            double rotationAngle = (index - books.length / 2) * 0.05;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotationAngle),
                    child: Container(
                      width: 100,
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(books[index].image),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
              Expanded(
                child: SizedBox(
                  width: 70,
                  child: Text(
                    books[index].name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
              ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
