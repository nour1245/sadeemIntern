import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class GetBestSellerRepo {
  final ApiServics _apiServics;
  GetBestSellerRepo(this._apiServics);
  Future<ApiResult<ProductsResponseModel>> getBestSeller() async {
    try {
      final response = await _apiServics.getBestSeller();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
