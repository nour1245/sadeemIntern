import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/helpers/extensions.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/core/themeing/colors.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/core/widgets/custom_text_button.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_cubit.dart';
import 'package:sadeem_tech_intern/features/login_screen/ui/widgets/login_form.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 63.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).WelcomeBack,
                style: AppTextStyle.headTextStyle(),
              ),
              SizedBox(height: 20.h),
              LoginForm(),
              SizedBox(height: 25.h),
              CustomTextButton(
                text: S.of(context).Login,
                onPressed: () async{
                await  context.read<LoginCubit>().login();
                  // context.pushNamed(Routes.homeScreen);
                },
                backgroundColor: ColorsManager.buttonColor,
              ),

              SizedBox(height: 40.h),
              creatAccountText(),
            ],
          ),
        ),
      ),
    );
  }

  Align creatAccountText() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Create An Account Now ! ",
              style: AppTextStyle.normalTextStyle().copyWith(fontSize: 14),
            ),
            TextSpan(
              text: "Sign Up",
              style: AppTextStyle.semiBoldTextStyle().copyWith(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
