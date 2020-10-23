import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bodipo/data/repository/repository.dart';
import 'package:flutter_bodipo/global/bloc/global_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState());

  // Инициализирую репозиторий
  Repository _repository = Repository();

  // Данные по логину
  TextEditingController loginTextController = TextEditingController();
  FocusNode loginFocusNode = FocusNode();
  // Данные по паролю
  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  // Ключ текстовых полей
  final formKey = GlobalKey<FormState>();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthButtonPressedEvent) {
      yield* _buildAuthButtonPressedEvent(event.globalBloc);
    }
  }

  Stream<AuthState> _buildAuthButtonPressedEvent(
      GlobalBloc _globalBloc) async* {
    if (formKey.currentState.validate()) {
      yield AuthLoadingState(isLoading: true);
      try {
        final authResponse = await _repository.getAuth(
            loginTextController.text, passwordTextController.text);
        yield AuthLoadingState(isLoading: false);
        if (authResponse != null) {
          debugPrint("AUTH_OK");
          _globalBloc.add(LoggedInEvent(token: authResponse.token));
        } else {
          yield AuthFailureState(error: "AUTH_ERROR");
          debugPrint("AUTH_ERROR");
        }
      } catch (error) {
        yield AuthFailureState(error: "AUTH_ERROR: $error");
        yield AuthLoadingState(isLoading: false);
        debugPrint("AUTH_ERROR: $error");
      }
    }
  }
}
