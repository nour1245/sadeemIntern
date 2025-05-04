import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/features/user_info/controller/cubit/user_info_cubit.dart';
import 'package:sadeem_tech_intern/features/user_info/controller/cubit/user_info_state.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_info_model.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h, left: 5.w, right: 5.w, bottom: 10.h),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          return state.whenOrNull(
                success: (userData) => userInfoLoaded(userData),
                loading: () => Center(child: CircularProgressIndicator()),
                failure: (error) => Center(child: Text(error)),
              ) ??
              SizedBox.shrink();
        },
      ),
    );
  }

  Column userInfoLoaded(UserInfo user) {
    return Column(
      children: [
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.image)),
        SizedBox(height: 16),
        Text(
          "${user.firstName} ${user.lastName}",
          style: AppTextStyle.mediumTextStyle(),
        ),
        SizedBox(height: 8),
        ListTile(leading: Icon(Icons.email), title: Text(user.email)),
        ListTile(leading: Icon(Icons.phone), title: Text(user.phone)),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            user.address.address +
                user.address.city +
                user.address.state +
                user.address.country,
          ),
        ),
      ],
    );
  }
}
