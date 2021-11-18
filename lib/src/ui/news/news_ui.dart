import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';
import 'package:news_ai/src/ui/news/components/news_components.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class NewsUI extends StatelessWidget {
  NewsUI({Key? key}) : super(key: key);

  static const String routeName = '/news';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => NewsUI(),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NewsApiRepository _newsApiRepository = NewsApiRepository();
  final String _title = 'Новости';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(newsApiRepository: _newsApiRepository),
      child: Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          title: _title,
        ),
        drawer: CustomDrawer(),
        body: const NewsContent(),
        floatingActionButton: const NewsFAB(),
      ),
    );
  }
}
