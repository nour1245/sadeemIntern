import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadeem_tech_intern/core/constants/api_const.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/cart_response_model.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/user_cart_response_model.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/login_request_body.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_info_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServics {
  factory ApiServics(Dio dio, {String baseUrl}) = _ApiServics;

  @POST(ApiConstants.login)
  Future<UserLoginResponseModel> userLogin(
    @Body() LoginRequestBody loginRequestBody,
  );

  @GET(ApiConstants.categories)
  Future<List<CategoriesFetchModel>> fetchCategories();

  @GET(ApiConstants.bestSeller)
  Future<ProductsResponseModel> getBestSeller();

  @POST(ApiConstants.userAddToCart)
  Future<CartResponseModel> addToCart(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.getCart)
  Future<UserCartResponse> getUserCart(@Path("userId") int userId);

  @GET(ApiConstants.getUserInfo)
  Future<UserInfo> getUserInfo();

  @GET(ApiConstants.getProductInfo)
  Future<Product> getProductById(@Path("id") int id);

  @GET(ApiConstants.getProductsByCategory)
  Future<ProductsResponseModel> getProductsByCategory(
    @Path("category") String category,
    @Query("limit") int limit,
    @Query("skip") int skip,
  );

  @GET(ApiConstants.searchProduct)
  Future<ProductsResponseModel> searchProduct(
    @Query("q") String productName,
    @Query("limit") int limit,
    @Query("skip") int skip,
  );

  @PUT(ApiConstants.getProductInfo)
  Future<void> updateCartItem(
    @Path("id") int productId,
    @Body() Map<String, dynamic> data,
  );

  @DELETE(ApiConstants.getProductInfo)
  Future<void> deleteCartItem(@Path("id") int productId);

 
}
