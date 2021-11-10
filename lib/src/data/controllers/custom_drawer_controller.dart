import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/data/models/models.dart';
import 'package:news_ai/src/ui/ui.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController to = Get.find();

  final GlobalKey<SliderMenuContainerState> sliderMenuKey = GlobalKey<SliderMenuContainerState>();

  RxInt currentPage = 0.obs;

  List<PageModel> pages = [
    PageModel(title: 'Обзор', route: '/dashboard', page: const DashboardUI()),
    PageModel(title: 'Агрегаторы новостей', route: '/aggregators', page: const AggregatorsUI()),
    PageModel(title: 'Сообщения', route: '/messages', page: const MessagesUI()),
    PageModel(title: 'Настройки', route: '/settings', page: const SettingsUI()),
    PageModel(title: 'Профиль', route: '/profile', page: const ProfileUI()),
  ];
}