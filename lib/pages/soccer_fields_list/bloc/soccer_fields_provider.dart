import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soccer_app/core/models/soccer_fields_model.dart';

class SoccerFieldsProvider {
  Future<SoccerFieldsListModel> getSoccerFields(
      {required String collectionId}) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('soccerFields')
          .doc(collectionId)
          .get();
      if (snapshot.exists) {
        return SoccerFieldsListModel.fromFirestore(snapshot);
      } else {
        throw Exception('Документ не существует');
      }
    } catch (error) {
      throw Exception('Ошибка при получении данных: $error');
    }
  }
}
