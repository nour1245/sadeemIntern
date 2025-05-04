import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class SearchProductRepo {
  final ApiServics _apiServics;
  SearchProductRepo(this._apiServics);

  Future<ApiResult<ProductsResponseModel>> searchProduct(
    String productName,
    int limit,
    int skip,
  ) async {
    try {
      final response = await _apiServics.searchProduct(
        productName,
        limit,
        skip,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
