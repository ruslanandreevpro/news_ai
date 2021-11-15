import 'package:flutter/material.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class DashboardUI extends StatelessWidget {
  DashboardUI({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = 'Обзор';

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
