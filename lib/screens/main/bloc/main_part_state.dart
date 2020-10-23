part of 'main_part_bloc.dart';

abstract class MainPartState extends Equatable {
  const MainPartState();

  @override
  List<Object> get props => [];
}

class MainPartInitialState extends MainPartState {
  final int indexScreen;
  MainPartInitialState({@required this.indexScreen});
  
  @override
  List<Object> get props => [indexScreen];
}
