import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';

class FetchCategoriesRepo {
  final ApiServics _apiServics;

  FetchCategoriesRepo(this._apiServics);
  Future<ApiResult<List<CategoriesFetchModel>>> fetchCategories() async {
    try {
      final result = await _apiServics.fetchCategories();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
