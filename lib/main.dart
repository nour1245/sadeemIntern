import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/constants/services.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/routing/app_router.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/myApp.dart';

void main() async {
  servicesLocator();
  runApp(
    BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}
