part of 'players_bloc.dart';

@immutable
abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class LoadingPlayersState extends PlayersState {}

class LoadedPlayersState extends PlayersState {
  final PlayerListModel playerListModel;
  LoadedPlayersState({
    required this.playerListModel,
  });
}

class ErrorPlayersState extends PlayersState {
  final String message;

  ErrorPlayersState({
    required this.message,
  });
}
