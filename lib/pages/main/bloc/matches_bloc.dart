import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_app/core/collections_id.dart';
import 'package:soccer_app/core/models/matches_model.dart';
import 'package:soccer_app/pages/main/bloc/matches_repository.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc() : super(MatchesInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      try {
        emit(LoadingMatchesState());

        MatchesListModel matchesList = await MatchesRepository()
            .getMatches(collectionId: CollectionsId.matches);

        emit(LoadedMatchesState(matchesList: matchesList));
      } catch (error) {
        throw Exception('Ошибка при получении данных: $error');
      }
    });
  }
}
