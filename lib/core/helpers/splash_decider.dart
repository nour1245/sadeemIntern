import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/di/dependancy.dart';
import 'package:sadeem_tech_intern/core/helpers/secure_storage_service.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_cubit.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/repos/login_repo.dart';
import 'package:sadeem_tech_intern/features/login_screen/ui/login_screen.dart';
import 'package:sadeem_tech_intern/features/onboarding/ui/onboarding_screen.dart';
import 'package:sadeem_tech_intern/main_navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDecider extends StatelessWidget {
  const SplashDecider({super.key});

  Future<Widget> _determineStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('onboarding_seen') ?? false;
    final token = await SecureStorageService.getToken();
    final userId = await SecureStorageService.getUserId();

    if (!hasSeenOnboarding) {
      return const OnboardingScreen();
    }

    // If token or userId is invalid, clear them and go to login
    if (token == null || token.isEmpty || userId == null) {
      await SecureStorageService.clear(); // Clear stale data
      return BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginScreen(),
      );
    }

    try {
      final userResult = await getIt<LoginRepo>().getUserById(userId);
      return userResult.when(
        success: (user) => MainNavigationScreen(userData: user),
        failure: (_) {
          // Token might be expired; clear storage and return to login
          SecureStorageService.clear();
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
          ;
        },
      );
    } catch (e) {
      // Handle unexpected errors (e.g., network issues)
      return BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginScreen(),
      );
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _determineStartScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return snapshot.data!;
        }
      },
    );
  }
}
