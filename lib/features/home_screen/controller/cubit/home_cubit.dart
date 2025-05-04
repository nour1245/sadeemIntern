import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_state.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/fetch_categories_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_best_seller_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_product_info.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_products_by_category.dart';

class HomeCubit extends Cubit<HomeState> {
  final box = Hive.box('categories');
  final GetProductInfoRepo _getProductInfoRepo;
  final FetchCategoriesRepo _fetchCategoriesRepo;
  final GetBestSellerRepo _getBestSellerRepo;
  final GetProductsByCategoryRepo _getProductsByCategoryRepo;
  HomeCubit(
    this._fetchCategoriesRepo,
    this._getBestSellerRepo,
    this._getProductInfoRepo,
    this._getProductsByCategoryRepo,
  ) : super(HomeState.initial());

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

  Future<Product> getProductInfo(int id) async {
    final result = await _getProductInfoRepo.getProductInfo(id);
    return result.when(
      success: (data) {
        return data;
      },
      failure: (apiErrorModel) {
        throw Exception(
          'Failed to fetch product info: ${apiErrorModel.message}',
        );
      },
    );
  }

  Future<List<Product>> getProductsByCategory({
    required String category,
    int limit = 10,
    int skip = 0,
  }) async {
    final result = await _getProductsByCategoryRepo.getProductsByCategory(
      category,
      limit,
      skip,
    );

    return result.when(
      success: (data) => data.products,
      failure: (apiErrorModel) {
        throw Exception(
          'Failed to fetch products by category: ${apiErrorModel.message ?? 'Unknown error'}',
        );
      },
    );
  }
}
