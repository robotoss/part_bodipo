part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  const GlobalState();
  
  @override
  List<Object> get props => [];
}

class UninitializedState extends GlobalState {}

class AuthenticatedState extends GlobalState {}

class UnauthenticatedState extends GlobalState {}

class LoadingState extends GlobalState {}
