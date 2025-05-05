import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/helpers/secure_storage_service.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/repos/login_repo.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      addOptions(dio!);
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addOptions(Dio dio) {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshToken = await SecureStorageService.getRefreshToken();
            if (refreshToken == null) return handler.reject(error);

            final newTokens = await getIt<LoginRepo>().refreshToken(
              refreshToken,
            );
            newTokens.whenOrNull(
              success: (data) async {
                await SecureStorageService.saveToken(data.accessToken);
                await SecureStorageService.saveRefreshToken(data.refreshToken);
                // Retry original request
                error.requestOptions.headers['Authorization'] =
                    'Bearer ${data.accessToken}';
                final retryResponse = await dio?.fetch(error.requestOptions);
                return handler.resolve(retryResponse!);
              },
              failure: (apiErrorModel) async {
                await SecureStorageService.clear();
                return handler.reject(error);
              },
            );
          }
          return handler.next(error);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
      ),
    );
  }
}
