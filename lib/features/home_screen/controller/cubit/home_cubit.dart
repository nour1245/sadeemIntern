import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_state.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/fetch_categories_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_best_seller_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final box = Hive.box('categories');
  final FetchCategoriesRepo _fetchCategoriesRepo;
  final GetBestSellerRepo _getBestSellerRepo;
  HomeCubit(this._fetchCategoriesRepo, this._getBestSellerRepo)
    : super(HomeState.initial());

  Future<void> fetchHomeData() async {
    emit(HomeState.loading());
    final response = await _fetchCategoriesRepo.fetchCategories();
    final bestSellerData = await getBestSeller();
    response.when(
      success: (categoriesFetchModel) {
        box.put('list', categoriesFetchModel);
        emit(HomeState.success(categoriesFetchModel, bestSellerData));
      },
      failure: (apiErrorModel) => emit(HomeState.failure(apiErrorModel)),
    );
  }

  Future<ProductsResponseModel> getBestSeller() async {
    final response = await _getBestSellerRepo.getBestSeller();
    return response.when(
      success: (productsResponseModel) {
        return productsResponseModel;
      },
      failure: (apiErrorModel) {
        throw Exception(
          'Failed to fetch best seller: ${apiErrorModel.message}',
        );
      },
    );
  }
}
