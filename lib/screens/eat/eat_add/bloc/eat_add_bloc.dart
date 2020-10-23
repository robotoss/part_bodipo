import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eat_add_event.dart';
part 'eat_add_state.dart';

class EatAddBloc extends Bloc<EatAddEvent, EatAddState> {
  EatAddBloc() : super(EatAddInitial());

  @override
  Stream<EatAddState> mapEventToState(
    EatAddEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
