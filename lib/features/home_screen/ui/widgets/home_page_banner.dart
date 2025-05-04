import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container homePageBanner() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/banner1.jpg"),
      ),
    ),
    width: 343.w,
    height: 189.h,
  );
}
