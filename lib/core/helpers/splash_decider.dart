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

    if (!hasSeenOnboarding) return const OnboardingScreen();

    final accessToken = await SecureStorageService.getToken();
    final refreshToken = await SecureStorageService.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      await SecureStorageService.clear();
      return _loginScreen();
    }

    try {
      final userResult = await getIt<LoginRepo>().getCurrentUser();
      return userResult.when(
        success: (user) => MainNavigationScreen(userData: user),
        failure: (error) => _handleTokenRefresh(refreshToken),
      );
    } catch (e) {
      return _loginScreen();
    }
  }

  Widget _loginScreen() => BlocProvider(
    create: (context) => getIt<LoginCubit>(),
    child: const LoginScreen(),
  );

  Future<Widget> _handleTokenRefresh(String refreshToken) async {
    final refreshResult = await getIt<LoginRepo>().refreshToken(refreshToken);
    return refreshResult.when(
      success: (newTokens) async {
        await SecureStorageService.saveToken(newTokens.accessToken);
        await SecureStorageService.saveRefreshToken(newTokens.refreshToken);
        final userResult = await getIt<LoginRepo>().getCurrentUser();
        return userResult.when(
          success: (user) => MainNavigationScreen(userData: user),
          failure: (_) => _loginScreen(),
        );
      },
      failure: (_) => _loginScreen(),
    );
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
