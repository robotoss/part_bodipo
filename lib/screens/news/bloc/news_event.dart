part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class InitialNewsDataEvent extends NewsEvent {}

class ShareNewsPressedEvent extends NewsEvent {
  final NewsModel newsData;
  ShareNewsPressedEvent({@required this.newsData});
}