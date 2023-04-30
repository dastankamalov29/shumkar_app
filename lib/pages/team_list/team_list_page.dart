import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/commons/text_style_helper.dart';
import 'package:soccer_app/core/models/team_model.dart';
import 'package:soccer_app/pages/main/widgets/image_loader_widget.dart';
import 'package:soccer_app/pages/team_list/team_bloc/team_bloc.dart';
import 'package:soccer_app/pages/team_list/widgets/bottom_players_sheet_widget.dart';

import '../../commons/theme_helper.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../main/widgets/loading_widget.dart';

class TeamListPage extends StatefulWidget {
  const TeamListPage({Key? key}) : super(key: key);

  @override
  State<TeamListPage> createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  late TeamBloc _teamBloc;

  @override
  void initState() {
    _teamBloc = BlocProvider.of(context);
    _teamBloc.add(GetTeamListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.blueGrey,
      appBar: customAppBar(context, title: 'Команды'),
      body: RefreshIndicator(
        onRefresh: () async => _teamBloc.add(GetTeamListEvent()),
        child: BlocConsumer<TeamBloc, TeamState>(
          bloc: _teamBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingTeamListState) {
              return LoadingWidget(
                width: MediaQuery.of(context).size.width,
                height: 80,
                widgetCount: 10,
              );
            }

            if (state is LoadedTeamListState) {
              var length = state.teamList.teamList?.length ?? 0;
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                itemCount: length,
                itemBuilder: (context, index) {
                  var team = state.teamList.teamList![index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ThemeHelper.white,
                      foregroundColor: ThemeHelper.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: ImageLoaderWidget(imageUrl: team.logo),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              team.name ?? '',
                              style: TextStyleHelper.f23w700,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'тренер: ${team.coach ?? ''}',
                              style: TextStyleHelper.f16w700,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'капитан: ${team.captain ?? ''}',
                              style: TextStyleHelper.f16w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => _showModalBottomSheet(
                      context,
                      teamModel: team,
                      collectionId: team.playersCollection!,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 25),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _showModalBottomSheet(
    BuildContext context, {
    required TeamModel teamModel,
    required String collectionId,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomPlayersSheetWidget(
          teamModel: teamModel,
          collectionId: collectionId,
        );
      },
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
