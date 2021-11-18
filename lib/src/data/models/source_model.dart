class Source {
  String? id;
  String? title;
  String? url;
  String? image;

  Source({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
  });

  factory Source.fromMap(Map<String, dynamic> data) {
    return Source(
      id: data['\$id'],
      title: data['title'],
      url: data['url'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    '\$id': id,
    'title': title,
    'url': url,
    'image': image,
  };
}