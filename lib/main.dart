import 'package:bloc_news/config/themes/app_theme.dart';
import 'package:bloc_news/di/injection_container.dart';
import 'package:bloc_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:bloc_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:bloc_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) =>sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Bloc News',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
