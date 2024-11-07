import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onChanged;
  final VoidCallback onTap;
  final IconData icon;

  const SearchBarWidget({
    super.key,
    required this.searchController,
    required this.onTap,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            alignment: Alignment.centerLeft,
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search a book by name or category',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          iconSize: 40,
        )
      ],
    );
  }
}
