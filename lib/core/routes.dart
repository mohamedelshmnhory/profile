import 'package:flutter/material.dart';
import 'package:profile/features/profile/data/models/user_profile.dart';
import '../features/profile/presentation/screens/personal_form_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/splash/splash.dart';

const SPLASH = "/";
const FORM_SCREEN = "/form_screen";
const PROFILE_SCREEN = "/profile_screen";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint(settings.name);

    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case FORM_SCREEN:
        final userProfile = settings.arguments as UserProfile?;
        return MaterialPageRoute(builder: (_) => PersonalFormScreen(user: userProfile));
      case PROFILE_SCREEN:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("no screen"),
            ),
          );
        });
    }
  }
}
