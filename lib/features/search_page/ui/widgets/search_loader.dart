import 'package:flutter/material.dart';

class SearchLoader extends StatelessWidget {
  const SearchLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: CircularProgressIndicator(),
    );
  }
}
