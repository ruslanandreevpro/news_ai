import 'package:get/get.dart';
import 'package:news_ai/src/ui/ui.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.initialPage, page: () => const SplashUI()),
    GetPage(name: Routes.signUpPage, page: () => SignUpUI()),
    GetPage(name: Routes.signInPage, page: () => SignInUI()),
    GetPage(name: Routes.welcomePage, page: () => const WelcomeUI()),
    GetPage(name: Routes.homePage, page: () => HomeUI()),
    GetPage(name: Routes.dashboardPage, page: () => const DashboardUI()),
    GetPage(name: Routes.dashboardPage, page: () => const AggregatorsUI()),
    GetPage(name: Routes.dashboardPage, page: () => const MessagesUI()),
    GetPage(name: Routes.dashboardPage, page: () => const SettingsUI()),
    GetPage(name: Routes.dashboardPage, page: () => const ProfileUI()),
  ];
}