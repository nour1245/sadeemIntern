import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/helpers/bloc_observer.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';

servicesLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoriesFetchModelAdapter());
  await Hive.openBox('categories');

  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
