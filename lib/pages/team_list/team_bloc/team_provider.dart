import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/team_model.dart';

class TeamProvider {
  Future<TeamListModel> getTeamsList({required String collectionId}) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('teamList')
          .doc(collectionId)
          .get();

      if (documentSnapshot.exists) {
        return TeamListModel.fromFirestore(documentSnapshot);
      } else {
        throw Exception('Документ не существует');
      }
    } catch (error) {
      throw Exception('Ошибка при получении данных: $error');
    }
  }
}
