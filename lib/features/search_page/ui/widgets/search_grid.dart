import 'package:flutter/material.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/widgets/product_grid_item.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/core/widgets/generic_grid_view.dart'; // Import your generic grid

class SearchGrid extends StatelessWidget {
  final List<Product> products;
  final ScrollController scrollController;

  const SearchGrid({
    super.key,
    required this.products,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GenericGridView<Product>(
      controller: scrollController,
      items: products,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      physics: const ScrollPhysics(),
      itemBuilder:
          (context, product) => ProductGridItem(
            product: product,
            onWishlistTap: () {},
            onTap:
                (_) => context.pushNamed(
                  Routes.productDetailsScreen,
                  arguments: product,
                ),
          ),
    );
  }
}
