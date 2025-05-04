import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductMetaInfo extends StatelessWidget {
  final int stock;
  final String category;

  const ProductMetaInfo({
    super.key,
    required this.stock,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Stock: $stock"),
            const Spacer(),
            Text("Category: $category"),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
