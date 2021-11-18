import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/bloc/news/news_event.dart';

class NewsFAB extends StatelessWidget {
  const NewsFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsBloc _newsBloc = BlocProvider.of<NewsBloc>(context);

    return FloatingActionButton(
      child: const Icon(LineIcons.syncIcon),
      tooltip: 'Обновить новости',
      onPressed: () => _newsBloc.add(NewsLoadEvent()),
    );
  }
}
