import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_app/core/collections_id.dart';
import 'package:soccer_app/core/models/team_model.dart';
import 'package:soccer_app/pages/team_list/team_bloc/team_repository.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc() : super(TeamInitial()) {
    on<GetTeamListEvent>((event, emit) async {
      emit(LoadingTeamListState());
      try {
        TeamListModel teamList = await TeamRepository()
            .getTeamsList(collectionId: CollectionsId.teamList);
        emit(LoadedTeamListState(teamList: teamList));
      } catch (error) {
        throw Exception('Ошибка при получении данных: $error');
      }
    });
  }
}
