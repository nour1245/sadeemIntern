import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description,
          style: AppTextStyle.normalTextStyle().copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
