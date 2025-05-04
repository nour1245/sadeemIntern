import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/widgets/cart_item_card.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/widgets/cart_total.dart';

class CartListView extends StatelessWidget {
  final List<CartProduct> products;
  final CartResponseModel cartData;

  const CartListView({
    super.key,
    required this.products,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(12.r),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) => CartItemCard(item: products[index]),
          ),
        ),
        CartTotals(cartData: cartData),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Trigger the purchase logic
              },
              child: const Text("Buy Now"),
            ),
          ),
        ),
      ],
    );
  }
}
