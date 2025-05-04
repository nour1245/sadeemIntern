import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final String thumbnailUrl;

  const ProductImage({super.key, required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.network(
        thumbnailUrl,
        height: 250.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
