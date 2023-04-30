import 'package:soccer_app/core/models/team_model.dart';
import 'package:soccer_app/pages/team_list/team_bloc/team_provider.dart';

class TeamRepository {
  Future<TeamListModel> getTeamsList({required String collectionId}) async {
    TeamProvider provider = TeamProvider();
    return await provider.getTeamsList(collectionId: collectionId);
  }
}
