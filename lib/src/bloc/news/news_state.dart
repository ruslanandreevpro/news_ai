abstract class NewsState {}

class NewsEmptyState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  List<dynamic> loadedNewsList;

  NewsLoadedState({required this.loadedNewsList});
}

class NewsErrorState extends NewsState {}