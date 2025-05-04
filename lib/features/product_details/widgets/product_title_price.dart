import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';

class ProductTitlePrice extends StatelessWidget {
  final String title;
  final double price;

  const ProductTitlePrice({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          title,
          style: AppTextStyle.semiBoldTextStyle().copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: AppTextStyle.semiBoldTextStyle().copyWith(
            color: Colors.green,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
