import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';

class HomePageCategoriesList extends StatelessWidget {
  const HomePageCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
                  ),
                ),
              ),
              Text("name  ",maxLines: 1,overflow: TextOverflow.ellipsis , style: AppTextStyle.normalTextStyle()),
            ],
          );
        },
      ),
    );
  }
}
