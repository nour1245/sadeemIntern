import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class ProductAdditionalInfo extends StatelessWidget {
  final Product product;

  const ProductAdditionalInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text("Brand: ${product.brand ?? "N/A"}"),
        Text("Shipping Info: ${product.shippingInformation}"),
        Text("Warranty: ${product.warrantyInformation}"),
        Text("Return Policy: ${product.returnPolicy}"),
        Text("Min Order Quantity: ${product.minimumOrderQuantity}"),
        Text("Availability: ${product.availabilityStatus}"),
        SizedBox(height: 24.h),
      ],
    );
  }
}
