import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class HomeUI extends StatelessWidget {
  final User user;

  HomeUI({Key? key, required this.user}) : super(key: key);

  static const String routeName = '/';

  Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => HomeUI(user: user),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = 'Главная';

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
