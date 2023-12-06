import 'dart:io';

import 'package:bloc_news/core/constants/constants.dart';
import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_news/features/daily_news/data/models/article.dart';
import 'package:bloc_news/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final httpResponse = await _newsApiService.getArticles(
        apiKey: apiKey,
        country: country,
        category: category,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
