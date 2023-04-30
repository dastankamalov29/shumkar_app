import 'package:soccer_app/core/models/news_model.dart';
import 'package:soccer_app/pages/news_list/bloc/news_provider.dart';

class NewsRepository {
  Future<NewsListModel> getNewsList({required String collectionId}) async {
    NewsProvider provider = NewsProvider();
    return await provider.getNewsList(collectionId: collectionId);
  }
}
