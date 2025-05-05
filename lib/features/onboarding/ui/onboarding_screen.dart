import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeem_tech_intern/core/themeing/colors.dart';
import 'package:sadeem_tech_intern/core/routing/routes.dart';
import 'package:sadeem_tech_intern/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Welcome to ShopEase',
      'subtitle': 'Discover thousands of products at unbeatable prices.',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Fast Delivery',
      'subtitle': 'Get your orders delivered to your doorstep quickly.',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Secure Payments',
      'subtitle': 'Your transactions are encrypted and secure.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(data['image']!, height: 200.h),
                        SizedBox(height: 30.h),
                        Text(
                          data['title']!,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          data['subtitle']!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  height: 10.h,
                  width: _currentPage == index ? 24.w : 10.w,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? ColorsManager.activeColor
                            : Colors.grey[400],
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Login button
            if (_currentPage == onboardingData.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToLogin,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      backgroundColor: ColorsManager.activeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(S.of(context).Login),
                  ),
                ),
              ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
