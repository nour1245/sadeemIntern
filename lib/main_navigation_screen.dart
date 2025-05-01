
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/themeing/colors.dart';
import 'package:sadeem_tech_intern/features/cart_page/cart_page.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/home_screen.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/features/settings_page/settings_page.dart';
import 'package:sadeem_tech_intern/features/wishlist_page/wishlist_page.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserLoginResponseModel userData;
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
      WishlistPage(),
      CartPage(),
      SettingsPage(),
      // BlocProvider(
      //   create: (_) => WishlistCubit()..loadWishlist(),
      //   child: const WishlistPage(),
      // ),
      // BlocProvider(
      //   create: (_) => CartCubit()..loadCart(),
      //   child: const CartPage(),
      // ),
      // BlocProvider(
      //   create: (_) => SettingsCubit(),
      //   child: const SettingsPage(),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Icon(Icons.heart_broken),
            label: 'Wishlist',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
