part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends GlobalEvent {}

class LoggedInEvent extends GlobalEvent {
  final String token;
  LoggedInEvent({@required this.token});
}

class LoggedOutEvent extends GlobalEvent {}
