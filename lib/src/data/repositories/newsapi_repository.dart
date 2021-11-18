import 'package:news_ai/src/data/models/models.dart';
import 'package:news_ai/src/data/providers/providers.dart';

class NewsApiRepository {
  final NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<List<News>> updateNews() => _newsApiProvider.getNews();
}