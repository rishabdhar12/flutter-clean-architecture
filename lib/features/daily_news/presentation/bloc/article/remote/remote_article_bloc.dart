// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:bloc_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:bloc_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticlesBloc(this._getArticleUsecase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emitter) async {
    final dataState = await _getArticleUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!),
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!),
      );
    }
  }
}
