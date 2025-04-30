import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';

class BestSellerGridview extends StatelessWidget {
  const BestSellerGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
                      ),
                    ),
                  ),
                ),
                Text(
                  "Women Printed Kurta",
                  style: AppTextStyle.mediumTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Neque porro quisquam est qui dolorem idsadsadsa ddsapsum quia",
                  style: AppTextStyle.normalTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("₹1500", style: AppTextStyle.mediumTextStyle()),
              ],
            ),
          );
        },
      ),
    );
  }
}
