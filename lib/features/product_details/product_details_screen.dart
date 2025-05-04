import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_state.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'widgets/product_image.dart';
import 'widgets/product_title_price.dart';
import 'widgets/product_description.dart';
import 'widgets/product_meta_info.dart';
import 'widgets/product_rating.dart';
import 'widgets/product_additional_info.dart';
import 'widgets/product_image_gallery.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Request was successful!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(product.title)),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(thumbnailUrl: product.thumbnail),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                  ),
                  onPressed: () {
                    context.read<CartCubit>().addProduct(product.id, 1);
                  },
                ),
              ),
              ProductTitlePrice(title: product.title, price: product.price),
              ProductDescription(description: product.description),
              ProductMetaInfo(stock: product.stock, category: product.category),
              ProductRating(rating: product.rating),
              ProductAdditionalInfo(product: product),
              if (product.images.isNotEmpty)
                ProductImageGallery(images: product.images),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
