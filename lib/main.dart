import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/helpers/bloc_observer.dart';
import 'package:sadeem_tech_intern/core/routing/app_router.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';
import 'package:sadeem_tech_intern/myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoriesFetchModelAdapter());
  await Hive.openBox('categories');

  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    BlocProvider(
      create: (context) => CartCubit(getIt()),
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}
