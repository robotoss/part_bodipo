import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bodipo/data/repository/repository.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(UninitializedState());

  // Инициализирую репозиторий
  Repository _repository = Repository();

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      yield* _buildAppStartedEvent();
    }
    if (event is LoggedInEvent) {
      yield* _buildLoggedInEvent(event.token);
    }
    if (event is LoggedOutEvent) {
      yield* _buildLoggedOutEvent();
    }
  }

  Stream<GlobalState> _buildAppStartedEvent() async* {
    // Проверяю есть ли локальный токен
    try {
      final localToken = await _repository.getToken();
      if (localToken != null) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    } catch (error) {}
  }

  Stream<GlobalState> _buildLoggedInEvent(String _token) async* {
    // Сохраняю токен
    await _repository.saveToken(_token);
    // Обновляю состояние приложения
    add(AppStartedEvent());
  }

  Stream<GlobalState> _buildLoggedOutEvent() async* {
    // Очищаю данные пользователя
    await _repository.removeToken();
    // Обновляю состояние приложения
    add(AppStartedEvent());
  }
}
