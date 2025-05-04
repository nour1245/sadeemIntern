import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://www.buy.airoxi.com/img/empty-cart-1.png',
            height: 200.h,
          ),
          const SizedBox(height: 20),
          const Text("Your cart is empty"),
        ],
      ),
    );
  }
}
