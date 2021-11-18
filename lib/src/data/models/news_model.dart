class News {
  NewsSource? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });

  factory News.fromJson(Map<String, dynamic> data) {
    return News(
      source: NewsSource.fromJson(data['source']),
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      urlToImage: data['urlToImage'],
      publishedAt: data['publishedAt'],
      content: data['content'],
    );
  }
}

class NewsSource {
  String? id;
  String? name;

  NewsSource({
    this.id,
    this.name,
  });

  factory NewsSource.fromJson(Map<String, dynamic> data) {
    return NewsSource(
      id: data['id'],
      name: data['name']
    );
  }
}