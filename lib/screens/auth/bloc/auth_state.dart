part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {
  final bool isLoading;

  const AuthLoadingState({@required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class AuthFailureState extends AuthState {
  final String error;
  const AuthFailureState({@required this.error});

  @override
  List<Object> get props => [error];
}
