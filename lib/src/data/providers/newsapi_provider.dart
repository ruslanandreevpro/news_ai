import 'package:dio/dio.dart';
import 'package:news_ai/src/core/constants/constants.dart';
import 'package:news_ai/src/data/models/models.dart';

class NewsApiProvider {

  Future<List<News>> getNews() async {
    final Dio _dio = Dio();
    final String _newsUrl = 'https://newsapi.org/v2/top-headlines?country=ru&pageSize=100&apiKey=${NewsApi.apiKey}';

    final _response = await _dio.get(
      _newsUrl,
      options: Options(
        headers: {

        }
      ),
    );

    if (_response.statusCode == 200) {
      print(_response.data['totalResults']);
      List<dynamic> newsJson = _response.data['articles'];
      return newsJson.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception('Ошибка загрузки новостей');
    }

    // if (result.statusCode == 200) {
    //   Map<String, dynamic> json = jsonDecode(result.body);
    //   List<dynamic> body = json['articles'];
    //   List<News> _news = body.map((item) => News.fromJson(item)).toList();
    //   return _news;
    // } else {
    //   throw Exception('Ошибка загрузки новостей');
    // }
  }
}