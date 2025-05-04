import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCartItem extends StatelessWidget {
  const ShimmerCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16.h, width: 140.w, color: Colors.white),
                  SizedBox(height: 6.h),
                  Container(height: 14.h, width: 100.w, color: Colors.white),
                  SizedBox(height: 6.h),
                  Container(height: 14.h, width: 120.w, color: Colors.white),
                  SizedBox(height: 6.h),
                  Container(height: 14.h, width: 130.w, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
