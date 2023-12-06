import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/core/usecases/usecase.dart';
import 'package:bloc_news/features/daily_news/domain/entities/article.dart';
import 'package:bloc_news/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUsecase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUsecase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticles();
  }
}
