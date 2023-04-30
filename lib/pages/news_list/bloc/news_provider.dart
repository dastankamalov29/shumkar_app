import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soccer_app/core/models/news_model.dart';

class NewsProvider {
  Future<NewsListModel> getNewsList({required String collectionId}) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('news')
          .doc(collectionId)
          .get();

      if (snapshot.exists) {
        return NewsListModel.fromFirestore(snapshot);
      } else {
        throw Exception('Документ не существует');
      }
    } catch (error) {
      throw Exception('Ошибка при получении данных: $error');
    }
  }
}
