import 'package:get/get.dart';
import 'package:instagram_clone/features/home/screens/home_screen.dart';
import 'package:instagram_clone/features/home/screens/initial_screen.dart';
import 'package:instagram_clone/features/profile/screens/profile_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String main = '/main';
  static const String home = '/';
  static const String profile = '/profile';

  static String getInitialRoute() => initial;
  static String getHomeRoute() => main;
  static String getProfileRoute() => profile;

  static final routes = <GetPage>[
    GetPage(name: main, page: () => const InitialScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}
