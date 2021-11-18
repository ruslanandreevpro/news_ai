import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/bloc/news/news_state.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsEmptyState) {
          return const Center(
            child: Text('Нет данных для отображения\nНажмите кнопку "Обновить"', textAlign: TextAlign.center,),
          );
        }

        if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is NewsErrorState) {
          return const Center(
            child: Text('Ошибка загрузки данных'),
          );
        }

        if (state is NewsLoadedState) {
          return ListView.builder(
            itemCount: state.loadedNewsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text('${state.loadedNewsList[index].title}'),
                subtitle: Text('${state.loadedNewsList[index].publishedAt}'),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
