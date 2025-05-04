import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/widgets/generic_grid_view.dart';
import 'package:sadeem_tech_intern/core/widgets/product_grid_item.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final ScrollController _scrollController = ScrollController();
  final int _limit = 8;
  int _skip = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _fetchProducts();
    }
  }

  Future<void> _fetchProducts() async {
    setState(() => _isLoading = true);
    try {
      final newProducts = await context.read<HomeCubit>().getProductsByCategory(
        category: widget.category,
        limit: _limit,
        skip: _skip,
      );
      setState(() {
        _products.addAll(newProducts);
        _skip += _limit;
        _hasMore = newProducts.length == _limit;
      });
    } catch (e) {
      debugPrint('Error fetching products: $e');
    }
    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          Expanded(
            child: GenericGridView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              items: _products,
              itemBuilder: (context, product) {
                return ProductGridItem(
                  product: product,
                  onTap:
                      (product) => context.pushNamed(
                        Routes.productDetailsScreen,
                        arguments: product,
                      ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
