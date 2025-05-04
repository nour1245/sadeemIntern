import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/features/search_page/controller/cubit/search_product_cubit.dart';
import 'package:sadeem_tech_intern/features/search_page/controller/cubit/search_product_state.dart';
import 'package:sadeem_tech_intern/features/search_page/ui/widgets/search_grid.dart';
import 'package:sadeem_tech_intern/features/search_page/ui/widgets/search_loader.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final int _limit = 10;

  int _skip = 0;
  bool _isFetchingMore = false;
  List<Product> _products = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isFetchingMore) {
      _fetchMoreResults();
    }
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = _searchController.text.trim();
      if (query.isNotEmpty) {
        _startNewSearch(query);
      } else {
        setState(() => _products.clear());
      }
    });
  }

  void _startNewSearch(String query) {
    _skip = 0;
    _products.clear();
    context.read<SearchProductCubit>().searchProduct(query, _limit, _skip);
  }

  Future<void> _fetchMoreResults() async {
    _isFetchingMore = true;
    _skip += _limit;
    await context.read<SearchProductCubit>().searchProduct(
      _searchController.text,
      _limit,
      _skip,
    );
    _isFetchingMore = false;
  }

  @override
  Widget build(BuildContext context) {
    return 
       SafeArea(
        child: Column(
          children: [
            SearchBar(controller: _searchController),
            Expanded(
              child: BlocConsumer<SearchProductCubit, SearchProductState>(
                listener: (context, state) {
                  if (state is Success) {
                    if (_skip == 0) {
                      _products = state.data.products;
                    } else {
                      _products.addAll(state.data.products);
                    }
                  }
                },
                builder: (context, state) {
                  if (state is Loading && _products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (_products.isEmpty) {
                    return const Center(child: Text("No products found."));
                  }

                  return SearchGrid(
                    products: _products,
                    scrollController: _scrollController,
                  );
                },
              ),
            ),
            if (_isFetchingMore) const SearchLoader(),
          ],
        ),
      );
  
  }
}
