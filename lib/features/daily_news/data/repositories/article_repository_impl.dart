import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/features/daily_news/data/models/article.dart';
import 'package:bloc_news/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getArticles() {
    throw UnimplementedError();
  }
}
