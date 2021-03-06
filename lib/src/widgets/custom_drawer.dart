import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 270.0,
        color: Colors.white,
        child: ListView(
          children: [
            customDrawerItem(
              title: 'Главная',
              icon: LineIcons.home,
              route: '/home',
            ),
            customDrawerItem(
              title: 'Обзор',
              icon: LineIcons.alternateTachometer,
              route: '/dashboard',
            ),
            customDrawerItem(
              title: 'Источники',
              icon: LineIcons.rssSquare,
              route: '/aggregators',
            ),
            customDrawerItem(
              title: 'Новости',
              icon: LineIcons.newspaper,
              route: '/news',
            ),
            customDrawerItem(
              title: 'Сообщения',
              icon: LineIcons.envelope,
              route: '/messages',
            ),
          ],
        ),
      ),
    );
  }

  Widget customDrawerItem({String? title, IconData? icon, String? route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title!),
      onTap: () {},
    );
  }
}