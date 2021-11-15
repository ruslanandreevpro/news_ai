import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/data/models/models.dart';
import 'package:news_ai/src/ui/ui.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController to = Get.find();

  // RxInt currentPage = 0.obs;
  //
  // List<PageModel> pages = [
  //   PageModel(
  //     title: 'Обзор',
  //     route: '/dashboard',
  //     page: DashboardUI()
  //   ),
  //   PageModel(
  //     title: 'Источники',
  //     route: '/aggregators',
  //     page: AggregatorsUI()
  //   ),
  //   PageModel(
  //     title: 'Сообщения',
  //     route: '/messages',
  //     page: MessagesUI()
  //   ),
  //   PageModel(
  //     title: 'Настройки',
  //     route: '/settings',
  //     page: SettingsUI()
  //   ),
  //   PageModel(
  //     title: 'Профиль',
  //     route: '/profile',
  //     page: ProfileUI()
  //   ),
  // ];

  void controlDrawer({required GlobalKey<ScaffoldState> key}) {
    if (!key.currentState!.isDrawerOpen) {
      key.currentState!.openDrawer();
    }
  }
}