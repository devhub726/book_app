import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const BookTitle({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: fontSize),
          ),
          Container(
            height: 1.0,
            width: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
