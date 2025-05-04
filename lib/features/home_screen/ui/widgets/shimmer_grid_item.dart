import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridItem extends StatelessWidget {
  const ShimmerGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 8.h),
            Container(height: 16.h, width: 100.w, color: Colors.white),
            SizedBox(height: 4.h),
            Container(height: 14.h, width: 140.w, color: Colors.white),
            SizedBox(height: 4.h),
            Container(height: 14.h, width: 80.w, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
