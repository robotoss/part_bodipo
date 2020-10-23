part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthButtonPressedEvent extends AuthEvent {
  final GlobalBloc globalBloc;
  AuthButtonPressedEvent({@required this.globalBloc});
}
