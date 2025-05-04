import 'package:flutter/material.dart';
import 'package:sadeem_tech_intern/category_products_screen.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_cubit.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/features/login_screen/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/features/onboarding/ui/onboarding_screen.dart';
import 'package:sadeem_tech_intern/main_navigation_screen.dart';
import 'package:sadeem_tech_intern/features/product_details/product_details_screen.dart';

class AppRouter {
  Route gnerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.mainScreen:
        final userData = settings.arguments as UserLoginResponseModel;
        return MaterialPageRoute(
          builder: (_) => MainNavigationScreen(userData: userData),
        );
      case Routes.productDetailsScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<CartCubit>(),
                child: ProductDetailsScreen(product: product),
              ),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.categoryProducts:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: CategoryProductsScreen(category: category),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
