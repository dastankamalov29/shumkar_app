import 'package:cloud_firestore/cloud_firestore.dart';

class MatchesListModel {
  final List<MatchesModel>? matchesList;

  MatchesListModel({
    required this.matchesList,
  });

  factory MatchesListModel.fromFirestore(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    final matchesList = data?['matchesList'] as List<dynamic>?;

    List<MatchesModel>? convertedMatchesList;
    if (matchesList != null) {
      convertedMatchesList = matchesList.map((matches) {
        return MatchesModel(
          match: matches['match'],
          teamOne: matches['teamOne'],
          teamOneGoals: matches['teamOneGoals'],
          teamOneLogo: matches['teamOneLogo'],
          teamTwo: matches['teamTwo'],
          teamTwoGoals: matches['teamTwoGoals'],
          teamTwoLogo: matches['teamTwoLogo'],
        );
      }).toList();
    }
    return MatchesListModel(matchesList: convertedMatchesList);
  }
}

class MatchesModel {
  final String? match;
  final String? teamOne;
  final int? teamOneGoals;
  final String? teamOneLogo;
  final String? teamTwo;
  final int? teamTwoGoals;
  final String? teamTwoLogo;

  MatchesModel({
    this.match,
    this.teamOne,
    this.teamOneGoals,
    this.teamOneLogo,
    this.teamTwo,
    this.teamTwoGoals,
    this.teamTwoLogo,
  });
}
