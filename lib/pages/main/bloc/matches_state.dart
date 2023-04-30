// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matches_bloc.dart';

@immutable
abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class LoadingMatchesState extends MatchesState {}

class LoadedMatchesState extends MatchesState {
  final MatchesListModel matchesList;

  LoadedMatchesState({
    required this.matchesList,
  });
}

class ErrorMatchesState extends MatchesState {
  final String message;

  ErrorMatchesState({
    required this.message,
  });
}
