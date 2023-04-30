import 'package:soccer_app/core/models/player_model.dart';
import 'package:soccer_app/pages/team_list/player_bloc/players_provider.dart';

class PlayersRepository {
  Future<PlayerListModel> getPlayers({required String collectionId}) async {
    PlayersProvider provider = PlayersProvider();
    return await provider.getPlayers(collectionId: collectionId);
  }
}
