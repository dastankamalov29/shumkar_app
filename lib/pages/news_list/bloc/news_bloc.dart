import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_app/core/collections_id.dart';
import 'package:soccer_app/core/models/news_model.dart';
import 'package:soccer_app/pages/news_list/bloc/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsListEvent>((event, emit) async {
      emit(LoadingGetNewsListState());
      try {
        NewsListModel newsListModel = await NewsRepository()
            .getNewsList(collectionId: CollectionsId.news);

        emit(LoadedGetNewsListState(newsListModel: newsListModel));
      } catch (error) {
        throw Exception('Ошибка при получении данных: $error');
      }
    });
  }
}
