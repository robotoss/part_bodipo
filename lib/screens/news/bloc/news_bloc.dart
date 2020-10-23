import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bodipo/data/models/temp/news_model.dart';
import 'package:flutter_bodipo/data/repository/repository.dart';
import 'package:share/share.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsLoadingState());

  // Инициализирую репозиторий
  Repository _repository = Repository();
  // Лист новостей
  List<NewsModel> newsList = List();
  // Тестовые картинки
  List<String> images = [
    'https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/03/17/14/05/sparkler-677774_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/04/11/19/46/building-102840_960_720.jpg'

  
  ];

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is InitialNewsDataEvent) {
      yield* _buildInitialNewsDataEvent();
    }
    if (event is ShareNewsPressedEvent) {
      yield* _buildShareNewsPressedEvent(event.newsData);
    }
  }

  Stream<NewsState> _buildInitialNewsDataEvent() async* {
    yield NewsLoadingState();
    // Пробу загрузить данные с сервера
    try {
      newsList = await _repository.getNewsList();
      yield NewsInitialState();
    } catch (error) {
      // Если произошла ошибка
      if (error is DioError) {
        // Если произошла ошибка при запросе
        debugPrint('GET_NEWS_ERROR: $error');
      } else {
        // Если произошла ошибка при работе
        debugPrint('GET_NEWS_ERROR: $error');
      }
    }
  }

  Stream<NewsState> _buildShareNewsPressedEvent(NewsModel _newsData) async* {
    await Share.share(
      "${_newsData.title}/n${_newsData.data}",
    );
  }
}
