part of 'soccer_fields_bloc.dart';

@immutable
abstract class SoccerFieldsState {}

class SoccerFieldsInitial extends SoccerFieldsState {}

class LoadingSoccerFieldsState extends SoccerFieldsState {}

class LoadedSoccerFieldsState extends SoccerFieldsState {
  final SoccerFieldsListModel soccerFields;

  LoadedSoccerFieldsState({
    required this.soccerFields,
  });
}

class ErrorSoccerFieldsState extends SoccerFieldsState {
  final String message;

  ErrorSoccerFieldsState({
    required this.message,
  });
}
