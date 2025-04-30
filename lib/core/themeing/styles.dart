import 'package:flutter/material.dart';

class AppTextStyle {
 static TextStyle headTextStyle() {
    return TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

 static TextStyle normalTextStyle() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
  }
   static TextStyle mediumTextStyle() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

 static TextStyle semiBoldTextStyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
