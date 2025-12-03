import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_resource/data_resource.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  final DataResource dataResource = DataResource();

  Future<void> getTrendingNews() async {
    emit(GetTrendingNewsLoading());
    await dataResource.getTrendingNews().then(
      (value) {
        log('Articles $value', name: 'get Trending news');
        emit(GetTrendingNewsSuccess(articles: value));
      },
      onError: (error) {
        log('Error $error', name: 'get Trending news');
        emit(GetTrendingNewsFaluire());
      },
    );
  }

  Future<void> getAllNews() async {
    emit(GetAllNewsLoading());
    await dataResource.getTrendingNews().then(
      (value) {
        log('Articles $value', name: 'get Trending news');
        emit(GetAllNewsSuccess(articles: value));
      },
      onError: (error) {
        log('Error $error', name: 'get Trending news');
        emit(GetAllNewsFaluire());
      },
    );
  }
}
