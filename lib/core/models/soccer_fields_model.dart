import 'package:cloud_firestore/cloud_firestore.dart';

class SoccerFieldsListModel {
  final List<SoccerFieldsModel>? soccerFieldsList;

  SoccerFieldsListModel({
    required this.soccerFieldsList,
  });

  factory SoccerFieldsListModel.fromFirestore(
      DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    final soccerFieldsList = data?['fieldsList'] as List<dynamic>?;

    List<SoccerFieldsModel>? convertedSoccerFieldsList;
    if (soccerFieldsList != null) {
      convertedSoccerFieldsList = soccerFieldsList.map((soccerFields) {
        return SoccerFieldsModel(
          name: soccerFields['name'],
          address: soccerFields['address'],
          image: soccerFields['image'],
        );
      }).toList();
    }

    return SoccerFieldsListModel(soccerFieldsList: convertedSoccerFieldsList);
  }
}

class SoccerFieldsModel {
  final String? name;
  final String? address;
  final String? image;

  SoccerFieldsModel({
    this.name,
    this.address,
    this.image,
  });
}
