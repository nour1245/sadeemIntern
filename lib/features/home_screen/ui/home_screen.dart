import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/colors.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/best_seller_gridview.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/home_page_banner.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/home_page_categories_list.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: ColorsManager.activeColor,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.heart_broken),
            label: 'wishlist',
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
          // Handle button tap
          print(">>>>>>>> $index");
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageBar(),
              SizedBox(height: 20.h),
              Text(
                S.of(context).Categories,
                style: AppTextStyle.semiBoldTextStyle().copyWith(fontSize: 18),
              ),
              HomePageCategoriesList(),
              SizedBox(height: 10.h),
              homePageBanner(),
              SizedBox(height: 5.h),
              Text("Best Seller", style: AppTextStyle.semiBoldTextStyle()),
              BestSellerGridview(),
            ],
          ),
        ),
      ),
    );
  }

  Row pageBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/app_logo.png'),
        Spacer(),
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage(
            "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
          ),
        ),
      ],
    );
  }
}
