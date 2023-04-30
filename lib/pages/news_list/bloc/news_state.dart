part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingGetNewsListState extends NewsState {}

class LoadedGetNewsListState extends NewsState {
  final NewsListModel newsListModel;

  LoadedGetNewsListState({
    required this.newsListModel,
  });
}

class ErrorGetNewsListState extends NewsState {
  final String message;

  ErrorGetNewsListState({required this.message});
}
