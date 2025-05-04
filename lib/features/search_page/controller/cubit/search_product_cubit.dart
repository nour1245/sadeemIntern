import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/features/search_page/controller/cubit/search_product_state.dart';
import 'package:sadeem_tech_intern/features/search_page/data/repos/search_product_repo.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit(this._searchProductRepo)
    : super(SearchProductState.initial());
  final SearchProductRepo _searchProductRepo;

  Future<void> searchProduct(String searchInput,int limit, int skip) async {
    emit(SearchProductState.loading());
    final result = await _searchProductRepo.searchProduct(
      searchInput,
      limit,
      skip,
    );
    result.when(
      success: (data) => emit(SearchProductState.success(data)),
      failure: (apiErrorModel) => apiErrorModel.message,
    );
  }
}
