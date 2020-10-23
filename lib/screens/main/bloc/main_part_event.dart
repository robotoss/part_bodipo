part of 'main_part_bloc.dart';

abstract class MainPartEvent extends Equatable {
  const MainPartEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends MainPartEvent {
  final int tabIndex;

  const ChangeTabEvent({
    @required this.tabIndex,
  });
}