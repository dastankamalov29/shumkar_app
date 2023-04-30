import 'package:soccer_app/core/models/soccer_fields_model.dart';
import 'package:soccer_app/pages/soccer_fields_list/bloc/soccer_fields_provider.dart';

class SoccerFieldsRepository {
  Future<SoccerFieldsListModel> getSoccerFields(
      {required String collectionId}) async {
    SoccerFieldsProvider provider = SoccerFieldsProvider();
    return await provider.getSoccerFields(collectionId: collectionId);
  }
}
