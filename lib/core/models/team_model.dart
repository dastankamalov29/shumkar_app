import 'package:cloud_firestore/cloud_firestore.dart';

class TeamListModel {
  final List<TeamModel>? teamList;

  TeamListModel({
    required this.teamList,
  });

  factory TeamListModel.fromFirestore(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    final teamList = data?['listOfTeam'] as List<dynamic>?;

    List<TeamModel>? convertedTeamList;
    if (teamList != null) {
      convertedTeamList = teamList.map((team) {
        return TeamModel(
          name: team['name'],
          captain: team['captain'],
          coach: team['coach'],
          foundation: team['foundation'],
          logo: team['logo'],
          playersCollection: team['playersCollection'],
        );
      }).toList();
    }

    return TeamListModel(teamList: convertedTeamList);
  }
}

class TeamModel {
  final String? name;
  final String? captain;
  final String? coach;
  final String? foundation;
  final String? logo;
  final String? playersCollection;

  TeamModel({
    required this.name,
    required this.captain,
    required this.coach,
    required this.foundation,
    required this.logo,
    required this.playersCollection,
  });
}
