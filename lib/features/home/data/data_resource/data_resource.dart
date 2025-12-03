import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class DataResource {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getTrendingNews() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin',
        options: Options(
          headers: {'Authorization': '743a5e969073405e932dd874a8fb4b50'},
        ),
      );
      final List<ArticleModel> articles = [];
      final Map<String, dynamic> data = response.data;
      data['articles'].forEach((element) {
        articles.add(ArticleModel.fromJson(element));
      });
      return articles;
    } on DioException catch (error) {
      log("error$error");
      return [];
    } on Exception catch (e) {
      log("error$e");
      return [];
      // TODO
    }
  }

  Future<List<ArticleModel>> getAllNews() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin',
      );
      final Map<String, dynamic> data = response.data;
      final List<ArticleModel> articles = [];
      data['articles'].forEach((element) {
        articles.add(ArticleModel.fromJson(element));
      });
      return articles;
    } on DioException catch (error) {
      log("error$error");
      return [];
    } on Exception catch (e) {
      log("error$e");
      return [];
      // TODO
    }
  }
}
