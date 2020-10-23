import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'main_part_event.dart';
part 'main_part_state.dart';

class MainPartBloc extends Bloc<MainPartEvent, MainPartState> {
  MainPartBloc() : super(MainPartInitialState(indexScreen: 0));

  // Индекс открытого экрана
  int indexScreen = 0;
  // Контроллер страниц
  PageController pageController = PageController();
  // Глобальные ключи старниц
  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Stream<MainPartState> mapEventToState(
    MainPartEvent event,
  ) async* {
    if (event is ChangeTabEvent) {
      yield* _buildChangeTabEvent(event.tabIndex);
    }
  }

  Stream<MainPartState> _buildChangeTabEvent(int _tabIndex) async* {
    // Делаю проверку нажатия пунка меню
    if (indexScreen == _tabIndex) {
      // Если нажатие на таб который уже открыт то перекидываю в начало навигации
      navigatorKeys[indexScreen]
        ..currentState.popUntil((route) => route.isFirst);
    } else {
      // В любом другом случае обновляю таб
      indexScreen = _tabIndex;
    }

    yield MainPartInitialState(
      indexScreen: indexScreen
    );
  }
}
