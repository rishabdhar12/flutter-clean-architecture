import 'package:bloc_news/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    final int? id,
    final String? author,
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
    final String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] ?? "",
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
