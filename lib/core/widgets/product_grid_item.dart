import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

typedef ProductItemTapCallback = void Function(Product product);

class ProductGridItem extends StatelessWidget {
  final Product product;
  final ProductItemTapCallback? onTap;
  final VoidCallback? onWishlistTap;
  final bool showRating;
  final bool showDiscount;

  const ProductGridItem({
    super.key,
    required this.product,
    this.onTap,
    this.onWishlistTap,
    this.showRating = true,
    this.showDiscount = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: InkWell(
        onTap: () => onTap?.call(product),
        child: Column(children: [_buildImageStack(), _buildProductInfo()]),
      ),
    );
  }

  Widget _buildImageStack() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product.thumbnail),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        if (onWishlistTap != null) _buildWishlistButton(),
        if (showRating) _buildRatingBadge(),
      ],
    );
  }

  Widget _buildWishlistButton() {
    return Positioned(
      top: 8.h,
      right: 8.w,
      child: GestureDetector(
        onTap: onWishlistTap,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(6),
          child: Icon(Icons.favorite_border, color: Colors.redAccent, size: 20),
        ),
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Positioned(
      bottom: 8.h,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: List.generate(5, (starIndex) {
            final rating = product.rating;
            return Icon(
              Icons.star,
              size: 14,
              color: starIndex < rating.round() ? Colors.amber : Colors.grey,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: AppTextStyle.mediumTextStyle().copyWith(fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          product.description,
          style: AppTextStyle.normalTextStyle(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (showDiscount) _buildPriceInfo(),
      ],
    );
  }

  Widget _buildPriceInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${product.price}\$",
          style: AppTextStyle.mediumTextStyle().copyWith(fontSize: 14),
        ),
        SizedBox(width: 8.w),
        Text(
          "${product.discountPercentage}% OFF",
          style: AppTextStyle.mediumTextStyle().copyWith(
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
