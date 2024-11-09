import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onChanged;
  final VoidCallback onTap;
  final IconData icon;
  final RxInt notificationsNumber;

  const SearchBarWidget({
    super.key,
    required this.searchController,
    required this.onTap,
    required this.icon,
    required this.onChanged,
    required this.notificationsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: searchController,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Search a book by name or category',
                  suffixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    // borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: onTap,
                icon: Icon(icon),
                iconSize: 40,
              ),
              Positioned(
                left: 28,
                top: 5,
                child: Container(
                  height: 20,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.87),
                    shape: BoxShape.circle,
                  ),
                  child: Obx(() => Text(
                        notificationsNumber.value > 99
                            ? "99+" // Show "99+" if the count exceeds 99
                            : "${notificationsNumber.value}", // Show the actual number otherwise
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
