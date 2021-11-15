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
    GetPage(name: Routes.dashboardPage, page: () => DashboardUI()),
    GetPage(name: Routes.aggregatorsPage, page: () => AggregatorsUI()),
    GetPage(name: Routes.messagesPage, page: () => MessagesUI()),
    GetPage(name: Routes.settingsPage, page: () => SettingsUI()),
    GetPage(name: Routes.profilePage, page: () => ProfileUI()),
  ];
}