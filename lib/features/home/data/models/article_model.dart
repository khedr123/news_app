class ArticleModel {
  final String author, title, description, url, image, publishedAt, content;
  final Map<String,dynamic> source;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author']??'',
      title: json['title']??'',
      description: json['description']??'',
      url: json['url']??'',
      image: json['urlToImage']??'',
      publishedAt: json['publishedAt']??'',
      content: json['content']??'',
      source: json['source']??'',
    );
  }
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});
}
