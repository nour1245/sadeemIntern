import 'package:flutter/material.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/widgets/generic_grid_view.dart';
import 'package:sadeem_tech_intern/core/widgets/product_grid_item.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.productsList});
  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productsList.isNotEmpty ? productsList[0].category : ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: GenericGridView(
              physics: BouncingScrollPhysics(),
              items: productsList,
              itemBuilder: (p0, p1) {
                return ProductGridItem(
                  product: p1,
                  onTap:
                      (product) => context.pushNamed(
                        Routes.productDetailsScreen,
                        arguments: product,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
