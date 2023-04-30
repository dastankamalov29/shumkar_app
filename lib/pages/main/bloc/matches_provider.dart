import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soccer_app/core/models/matches_model.dart';

class MatchesProvider {
  Future<MatchesListModel> getMathes({required String collectionId}) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('matches')
          .doc(collectionId)
          .get();

      if (snapshot.exists) {
        return MatchesListModel.fromFirestore(snapshot);
      } else {
        throw Exception('Документ не существует');
      }
    } catch (error) {
      throw Exception('Ошибка при получении данных: $error');
    }
  }
}
