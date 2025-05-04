import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/core/networking/dio_factory.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/repos/cart_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/fetch_categories_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_best_seller_repo.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_product_info.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/repos/get_products_by_category.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_cubit.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/repos/login_repo.dart';
import 'package:sadeem_tech_intern/features/search_page/controller/cubit/search_product_cubit.dart';
import 'package:sadeem_tech_intern/features/search_page/data/repos/search_product_repo.dart';
import 'package:sadeem_tech_intern/features/user_info/controller/cubit/user_info_cubit.dart';
import 'package:sadeem_tech_intern/features/user_info/data/repos/user_info_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  //apiservices
  getIt.registerLazySingleton<ApiServics>(() => ApiServics(dio));
  //login cubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //home Cubit
  getIt.registerLazySingleton<FetchCategoriesRepo>(
    () => FetchCategoriesRepo(getIt()),
  );
  getIt.registerLazySingleton<GetBestSellerRepo>(
    () => GetBestSellerRepo(getIt()),
  );
  getIt.registerLazySingleton<GetProductInfoRepo>(
    () => GetProductInfoRepo(getIt()),
  );
  getIt.registerLazySingleton<GetProductsByCategoryRepo>(
    () => GetProductsByCategoryRepo(getIt()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt(), getIt(), getIt(), getIt()),
  );

  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  //
  getIt.registerLazySingleton<UserInfoRepo>(() => UserInfoRepo(getIt()));
  getIt.registerFactory<UserInfoCubit>(() => UserInfoCubit(getIt()));

  //
  getIt.registerLazySingleton<SearchProductRepo>(
    () => SearchProductRepo(getIt()),
  );
  getIt.registerFactory<SearchProductCubit>(() => SearchProductCubit(getIt()));
}
