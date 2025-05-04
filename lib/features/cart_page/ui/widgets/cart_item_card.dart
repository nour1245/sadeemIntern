import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';

class CartItemCard extends StatelessWidget {
  final CartProduct item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                item.thumbnail,
                height: 80.h,
                width: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.semiBoldTextStyle().copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text("Price: \$${item.price}"),
                  Text("Qty: ${item.quantity}"),
                  Text("Total: \$${item.total.toStringAsFixed(2)}"),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Update Button
                      IconButton(
                        onPressed: () {
                          // You can show a dialog to update the quantity
                          _showUpdateQuantityDialog(context, item);
                        },
                        icon: Icon(Icons.edit, color: Colors.blue),
                      ),

                      // Delete Button
                      IconButton(
                        onPressed: () {
                          // Call the CartCubit to remove the product
                          context.read<CartCubit>().deleteCartItem(item.id);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show a dialog for updating quantity
  void _showUpdateQuantityDialog(BuildContext context, CartProduct item) {
    TextEditingController quantityController = TextEditingController(
      text: item.quantity.toString(),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Quantity"),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Quantity"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int updatedQuantity =
                    int.tryParse(quantityController.text) ?? item.quantity;
                context.read<CartCubit>().updateCartItem(item.id, {
                  "quantity": updatedQuantity,
                });
                Navigator.of(context).pop();
              },
              child: Text("Update"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
