import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/home_screen/data/models/products_response_model.dart';

class BestSellerGridview extends StatelessWidget {
  final List<Product> bestseller;
  const BestSellerGridview({super.key, required this.bestseller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemCount: bestseller.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(bestseller[index].thumbnail),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: List.generate(5, (starIndex) {
                            final rating = bestseller[index].rating;
                            return Icon(
                              Icons.star,
                              size: 14,
                              color:
                                  starIndex < rating.round()
                                      ? Colors.amber
                                      : Colors.grey,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  bestseller[index].title,
                  style: AppTextStyle.mediumTextStyle().copyWith(fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  bestseller[index].description,
                  style: AppTextStyle.normalTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${bestseller[index].price}\$",
                      style: AppTextStyle.mediumTextStyle(),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${bestseller[index].discountPercentage}% OFF",
                      style: AppTextStyle.mediumTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
