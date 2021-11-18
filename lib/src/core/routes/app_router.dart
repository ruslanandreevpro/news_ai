// import 'package:flutter/material.dart';
// import 'package:news_ai/src/ui/ui.dart';
//
// class AppRouter {
//   static Route onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return HomeUI.route();
//       case SignUpUI.routeName:
//         return SignUpUI.route();
//       case SignInUI.routeName:
//         return SignInUI.route();
//       case WelcomeUI.routeName:
//         return WelcomeUI.route();
//       case AggregatorsUI.routeName:
//         return AggregatorsUI.route();
//       case DashboardUI.routeName:
//         return DashboardUI.route();
//       case NewsUI.routeName:
//         return NewsUI.route();
//       case MessagesUI.routeName:
//         return MessagesUI.route();
//       case SettingsUI.routeName:
//         return SettingsUI.route();
//       case ProfileUI.routeName:
//         return ProfileUI.route();
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(appBar: AppBar(title: const Text('Ошибка'),),),
//       settings: const RouteSettings(name: 'error'),
//     );
//   }
// }