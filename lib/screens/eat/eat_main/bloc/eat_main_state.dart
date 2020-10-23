part of 'eat_main_bloc.dart';

abstract class EatMainState extends Equatable {
  const EatMainState();
  
  @override
  List<Object> get props => [];
}

class EatMainInitialState extends EatMainState {}

class NewsLoadingState extends EatMainState {}
