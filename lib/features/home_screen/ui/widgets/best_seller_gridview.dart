import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/widgets/generic_grid_view.dart';
import 'package:sadeem_tech_intern/core/widgets/product_grid_item.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class BestSellerGridview extends StatelessWidget {
  final List<Product> bestseller;
  const BestSellerGridview({super.key, required this.bestseller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GenericGridView(
        items: bestseller,
        itemBuilder: (context, product) {
          return ProductGridItem(
            product: product,
            onTap: (product) => _handleProductTap(context, product.id),
          );
        },
      ),
    );
  }
}

_handleProductTap(BuildContext context, id) async {
  final product = await context.read<HomeCubit>().getProductInfo(id);
  context.mounted
      ? context.pushNamed(Routes.productDetailsScreen, arguments: product)
      : null;
}
