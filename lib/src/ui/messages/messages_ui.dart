import 'package:flutter/material.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class MessagesUI extends StatelessWidget {
  MessagesUI({Key? key}) : super(key: key);

  static const String routeName = '/messages';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => MessagesUI(),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = 'Сообщения';

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
