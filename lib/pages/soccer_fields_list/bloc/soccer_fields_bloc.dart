import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soccer_app/core/collections_id.dart';
import 'package:soccer_app/core/models/soccer_fields_model.dart';
import 'package:soccer_app/pages/soccer_fields_list/bloc/soccer_fields_repository.dart';

part 'soccer_fields_event.dart';
part 'soccer_fields_state.dart';

class SoccerFieldsBloc extends Bloc<SoccerFieldsEvent, SoccerFieldsState> {
  SoccerFieldsBloc() : super(SoccerFieldsInitial()) {
    on<GetSoccerFieldsEvent>((event, emit) async {
      emit(LoadingSoccerFieldsState());
      try {
        SoccerFieldsListModel soccerFields = await SoccerFieldsRepository()
            .getSoccerFields(collectionId: CollectionsId.soccerFields);

        emit(LoadedSoccerFieldsState(soccerFields: soccerFields));
      } catch (error) {
        throw Exception('Ошибка при получении данных: $error');
      }
    });
  }
}
