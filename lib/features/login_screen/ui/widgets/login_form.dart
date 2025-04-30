import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/core/widgets/custom_text_form_field.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: S.of(context).UserName,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          SizedBox(height: 25.h),
          CustomTextFormField(
            hintText: S.of(context).Password,
            prefixIcon: Icons.lock,
            keyboardType: TextInputType.text,
            obscureText: true,
            suffixIcon: Icons.remove_red_eye_outlined,
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              S.of(context).ForgotPassword,
              style: AppTextStyle.normalTextStyle().copyWith(
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
