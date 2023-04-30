part of 'players_bloc.dart';

@immutable
abstract class PlayersEvent {}

class GetPlayersEvent extends PlayersEvent {
  final String collectionId;

  GetPlayersEvent({
    required this.collectionId,
  });
}
