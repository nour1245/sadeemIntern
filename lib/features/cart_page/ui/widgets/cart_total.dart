import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';

class CartTotals extends StatelessWidget {
  final CartResponseModel cartData;

  const CartTotals({super.key, required this.cartData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100.h, left: 10.w, right: 10.w),
      child: Row(
        children: [
          Text(
            "Total: ${cartData.total.round()}",
            style: AppTextStyle.mediumTextStyle().copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          Text(
            "Total Quantity: ${cartData.totalQuantity}",
            style: AppTextStyle.mediumTextStyle().copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
