import 'package:soccer_app/core/models/matches_model.dart';
import 'package:soccer_app/pages/main/bloc/matches_provider.dart';

class MatchesRepository {
  Future<MatchesListModel> getMatches({required String collectionId}) async {
    MatchesProvider provider = MatchesProvider();
    return await provider.getMathes(collectionId: collectionId);
  }
}
