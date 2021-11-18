import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/news/news_event.dart';
import 'package:news_ai/src/bloc/news/news_state.dart';
import 'package:news_ai/src/data/models/models.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsApiRepository newsApiRepository;

  NewsBloc({required this.newsApiRepository}) : super(NewsEmptyState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsLoadEvent) {
      yield NewsLoadingState();
      try {
        final List<News> _loadedNewsList = await newsApiRepository.updateNews();
        yield NewsLoadedState(
          loadedNewsList: _loadedNewsList,
        );
      } catch (_) {
        yield NewsErrorState();
      }
    } else if (event is NewsClearEvent) {
      yield NewsEmptyState();
    }
  }
}