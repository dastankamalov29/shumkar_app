part of 'team_bloc.dart';

@immutable
abstract class TeamState {}

class TeamInitial extends TeamState {}

class LoadingTeamListState extends TeamState {}

class LoadedTeamListState extends TeamState {
  final TeamListModel teamList;

  LoadedTeamListState({
    required this.teamList,
  });
}

class ErrorTeamListState extends TeamState {
  final String message;

  ErrorTeamListState({
    required this.message,
  });
}
