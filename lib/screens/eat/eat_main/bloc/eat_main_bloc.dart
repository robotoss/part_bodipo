import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bodipo/data/models/temp/eat_model.dart';
import 'package:flutter_bodipo/data/repository/repository.dart';

part 'eat_main_event.dart';
part 'eat_main_state.dart';

class EatMainBloc extends Bloc<EatMainEvent, EatMainState> {
  EatMainBloc() : super(NewsLoadingState());

  // Инициализирую репозиторий
  Repository _repository = Repository();
  // Лист питания
  List<EatModel> newsList = List();

  @override
  Stream<EatMainState> mapEventToState(
    EatMainEvent event,
  ) async* {
    if (event is InitialEatMainDataEvent) {
      yield* _buildInitialEatMainDataEvent();
    }
  }

  Stream<EatMainState> _buildInitialEatMainDataEvent() async* {
    // Пробу загрузить данные с сервера
    try {
      newsList = await _repository.getEatList();
    } catch (error) {
      // Если произошла ошибка
      if (error is DioError) {
        // Если произошла ошибка при запросе
        print('GET_NEWS_ERROR: $error');
      } else {
        // Если произошла ошибка при работе
        print('GET_NEWS_ERROR: $error');
      }
    }
  }
}
