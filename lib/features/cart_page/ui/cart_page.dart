import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_state.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/widgets/cart_empty_view.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/widgets/cart_list_view.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/widgets/shimmer_cartItem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.whenOrNull(
                userCartloading:
                    () => ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: 5,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, __) => const ShimmerCartItem(),
                    ),
                userCartsuccess: (data) {
                  final List<CartProduct> products =
                      data.carts.isNotEmpty ? data.carts[0].products : [];

                  if (products.isEmpty) return const CartEmptyView();

                  return CartListView(
                    products: products,
                    cartData: data.carts[0],
                  );
                },
                error:
                    (message) => Center(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
              ) ??
              const Center(
                child: Text('Something went wrong. Please try again.'),
              );
        },
      ),
    );
  }
}
