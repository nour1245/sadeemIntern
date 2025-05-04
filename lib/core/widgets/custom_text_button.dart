import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final Size? size;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF2196F3), // default blue
    this.textColor = Colors.white,
    this.textStyle,
    this.borderRadius = 4.0,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(size ?? Size(317.w, 55.h)),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle?.copyWith(color: textColor) ??
            TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
