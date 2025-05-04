import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class GetProductInfoRepo {
  final ApiServics _apiServics;
  GetProductInfoRepo(this._apiServics);
  Future<ApiResult<Product>> getProductInfo(int id) async {
    try {
      final response = await _apiServics.getProductById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
