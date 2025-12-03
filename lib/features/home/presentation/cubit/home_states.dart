import 'package:news_app/features/home/data/models/article_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetTrendingNewsLoading extends HomeStates {}

class GetTrendingNewsSuccess extends HomeStates {
  final List<ArticleModel> articles;

  GetTrendingNewsSuccess({required this.articles});
}

class GetTrendingNewsFaluire extends HomeStates {}

class GetAllNewsLoading extends HomeStates {}

class GetAllNewsSuccess extends HomeStates {
  final List<ArticleModel> articles;

  GetAllNewsSuccess({required this.articles});
}

class GetAllNewsFaluire extends HomeStates {}
