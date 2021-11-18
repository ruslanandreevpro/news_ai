import 'package:flutter/material.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class SettingsUI extends StatelessWidget {
  SettingsUI({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SettingsUI(),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = 'Настройки';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        title: _title,
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
