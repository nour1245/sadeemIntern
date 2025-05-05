import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/themeing/colors.dart';
import 'package:sadeem_tech_intern/features/cart_page/ui/cart_page.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/home_screen.dart';
import 'package:sadeem_tech_intern/features/search_page/controller/cubit/search_product_cubit.dart';
import 'package:sadeem_tech_intern/features/user_info/controller/cubit/user_info_cubit.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_profile_model.dart';
import 'package:sadeem_tech_intern/features/user_info/user_info_page.dart';
import 'package:sadeem_tech_intern/features/search_page/search_page.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserProfile userData;
  const MainNavigationScreen({super.key, required this.userData});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      BlocProvider(
        create: (_) => getIt<HomeCubit>()..fetchHomeData(),
        child: HomeScreen(userData: widget.userData),
      ),
      BlocProvider(
        create: (context) => getIt<SearchProductCubit>(),
        child: SearchPage(),
      ),
      BlocProvider(
        create: (_) => getIt<CartCubit>()..getUserCart(),
        child: const CartPage(),
      ),
      BlocProvider(
        create: (context) => getIt<UserInfoCubit>()..getUserInfo(),
        child: UserInfoPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // or any color you want
        statusBarIconBrightness: Brightness.dark, // for dark icons
      ),
    );
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: _selectedIndex,
            backgroundColor: ColorsManager.activeColor,
            items: [
              CurvedNavigationBarItem(
                child: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.search),
                label: 'Search',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.shopping_cart_sharp),
                label: 'Cart',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.person_2_outlined),
                label: 'User',
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
