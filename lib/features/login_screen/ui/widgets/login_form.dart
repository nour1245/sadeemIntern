import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/styles.dart';
import 'package:sadeem_tech_intern/core/widgets/custom_text_form_field.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_cubit.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().userNameController,
            hintText: S.of(context).UserName,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          SizedBox(height: 25.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: S.of(context).Password,
            prefixIcon: Icons.lock,
            keyboardType: TextInputType.text,
            obscureText: !isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
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
