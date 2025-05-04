import 'package:sadeem_tech_intern/core/helpers/secure_storage_service.dart';
import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/user_cart_response_model.dart';

class CartRepo {
  final ApiServics _apiServics;

  CartRepo(this._apiServics);

  Future<ApiResult<CartResponseModel>> addItemToCart(
    int productId,
    int quantity,
  ) async {
    try {
      final userId = await SecureStorageService.getUserId();
      if (userId == null) throw Exception('User not logged in');

      final body = {
        "userId": userId,
        "products": [
          {"id": productId, "quantity": quantity},
        ],
      };
      final response = await _apiServics.addToCart(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> updateCartItem(
    int productId,
    Map<String, dynamic> updatedData,
  ) async {
    try {
      await _apiServics.updateCartItem(productId, updatedData);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> deleteCartItem(int productId) async {
    try {
      await _apiServics.deleteCartItem(productId);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserCartResponse>> getUserCart(userId) async {
    try {
      final response = await _apiServics.getUserCart(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
