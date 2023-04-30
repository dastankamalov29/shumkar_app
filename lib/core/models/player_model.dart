import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerListModel {
  final List<PlayerModel>? playerList;

  PlayerListModel({
    required this.playerList,
  });

  factory PlayerListModel.fromFirestore(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    final playerList = data?['playersList'] as List<dynamic>?;

    List<PlayerModel>? convertedPlayerList;
    if (playerList != null) {
      convertedPlayerList = playerList.map((player) {
        return PlayerModel(
            name: player['name'],
            lastName: player['lastName'],
            playerNumber: player['number']);
      }).toList();
    }

    return PlayerListModel(playerList: convertedPlayerList);
  }
}

class PlayerModel {
  final String? name;
  final String? lastName;
  final int? playerNumber;

  PlayerModel({
    this.name,
    this.lastName,
    this.playerNumber,
  });
}
