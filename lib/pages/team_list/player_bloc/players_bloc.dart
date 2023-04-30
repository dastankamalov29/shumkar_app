import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_app/core/models/player_model.dart';
import 'package:soccer_app/pages/team_list/player_bloc/players_repository.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(PlayersInitial()) {
    on<GetPlayersEvent>((event, emit) async {
      emit(LoadingPlayersState());
      try {
        PlayerListModel players = await PlayersRepository()
            .getPlayers(collectionId: event.collectionId);
        emit(LoadedPlayersState(playerListModel: players));
      } catch (error) {
        throw Exception('Ошибка при получении данных: $error');
      }
    });
  }
}
