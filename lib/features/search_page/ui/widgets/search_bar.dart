import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  const SearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
