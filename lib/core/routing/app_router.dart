import 'package:flutter/material.dart';

class AppRouter {
  Route gnerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.onboardingScreen:
      //   return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create: (context) => getIt<HomeCubit>()..getHomePageData(),
      //           child: const HomeScreen(),
      //         ),
      //   );

        

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
