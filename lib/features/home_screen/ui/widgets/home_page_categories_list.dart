import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return SizedBox(
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
                      "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
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
          );
        },
      ),
    );
  }
}
