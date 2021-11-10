import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/data/controllers/controllers.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final CustomDrawerController _customDrawerController = CustomDrawerController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            customDrawerItem(
              title: 'Обзор',
              icon: LineIcons.home,
              route: '/dashboard',
            ),
            customDrawerItem(
              title: 'Агрегаторы',
              icon: LineIcons.rssSquare,
              route: '/aggregators',
            ),
            customDrawerItem(
              title: 'Сообщения',
              icon: LineIcons.envelope,
              route: '/messages',
            ),
            customDrawerItem(
              title: 'Настройки',
              icon: LineIcons.cog,
              route: '/settings',
            ),
            customDrawerItem(
              title: 'Профиль',
              icon: LineIcons.user,
              route: '/profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget customDrawerItem({String? title, IconData? icon, String? route}) {
    return ListTile(
        title: Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        onTap: () {
          _customDrawerController.sliderMenuKey.currentState!.closeDrawer();
          var result = _customDrawerController.pages.indexWhere((element) => element.route == route);
          _customDrawerController.currentPage.value = result;
        }
    );
  }
}