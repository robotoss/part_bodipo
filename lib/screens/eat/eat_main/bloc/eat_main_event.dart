part of 'eat_main_bloc.dart';

abstract class EatMainEvent extends Equatable {
  const EatMainEvent();

  @override
  List<Object> get props => [];
}

class InitialEatMainDataEvent extends EatMainEvent {}