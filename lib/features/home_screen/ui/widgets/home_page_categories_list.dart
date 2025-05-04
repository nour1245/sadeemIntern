import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/categories_model.dart';

class HomePageCategoriesList extends StatelessWidget {
  final List<CategoriesFetchModel> categoriesList;
  const HomePageCategoriesList({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(
                Routes.categoryProducts,
                arguments: categoriesList[index].slug,
              );
            },

            child: SizedBox(
              width: 80.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/business-and-management-1/24/MARKET_SHARE-512.png",
                      ),
                    ),
                  ),
                  Text(
                    categoriesList[index].slug,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.normalTextStyle(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
