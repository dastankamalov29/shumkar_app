import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soccer_app/core/models/player_model.dart';

class PlayersProvider {
  Future<PlayerListModel> getPlayers({required String collectionId}) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('players')
          .doc(collectionId)
          .get();

      if (snapshot.exists) {
        return PlayerListModel.fromFirestore(snapshot);
      } else {
        throw Exception('Документ не существует');
      }
    } catch (error) {
      throw Exception('Ошибка при получении данных: $error');
    }
  }
}
