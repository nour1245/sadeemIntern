import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_cubit.dart';
import 'package:sadeem_tech_intern/features/home_screen/controller/cubit/home_state.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/best_seller_gridview.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/home_page_banner.dart';
import 'package:sadeem_tech_intern/features/home_screen/ui/widgets/home_page_categories_list.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  final UserLoginResponseModel userData;
  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
      child: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Failure) {
              return Center(
                child: Text(state.apiErrorModel.message ?? "Try later"),
              );
            } else if (state is Success) {
              final bestSellers = state.bestSeller.products;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pageBar(userData),
                  SizedBox(height: 20.h),
                  Text(
                    S.of(context).Categories,
                    style: AppTextStyle.semiBoldTextStyle().copyWith(
                      fontSize: 18,
                    ),
                  ),
                  HomePageCategoriesList(
                    categoriesList: Hive.box(
                      'categories',
                    ).get('list', defaultValue: <CategoriesFetchModel>[]),
                  ),
                  SizedBox(height: 10.h),
                  homePageBanner(),
                  SizedBox(height: 5.h),
                  Text("Best Seller", style: AppTextStyle.semiBoldTextStyle()),
                  BestSellerGridview(bestseller: bestSellers),
                ],
              );
            } else {
              return Center(child: Text("No state triggered"));
            }
          },
        ),
      ),
    );
  }

  Row pageBar(UserLoginResponseModel userData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/app_logo.png'),
        Spacer(),
        Text(
          "Hi,${userData.firstName}",
          style: AppTextStyle.semiBoldTextStyle(),
        ),
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage(userData.image),
        ),
      ],
    );
  }
}
