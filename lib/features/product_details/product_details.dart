import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(thumbnailUrl: product.thumbnail),
            ProductTitlePrice(title: product.title, price: product.price),
            ProductDescription(description: product.description),
            ProductMetaInfo(stock: product.stock, category: product.category),
            ProductRating(rating: product.rating),
            ProductAdditionalInfo(product: product),
            if (product.images.isNotEmpty)
              ProductImageGallery(images: product.images),
          ],
        ),
      ),
    );
  }
}
