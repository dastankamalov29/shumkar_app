import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/core/models/team_model.dart';
import 'package:soccer_app/pages/main/widgets/loading_widget.dart';
import 'package:soccer_app/pages/team_list/player_bloc/players_bloc.dart';

import '../../../commons/text_style_helper.dart';
import '../../../commons/theme_helper.dart';
import '../../main/widgets/image_loader_widget.dart';

class BottomPlayersSheetWidget extends StatefulWidget {
  final TeamModel teamModel;
  final String collectionId;
  const BottomPlayersSheetWidget({
    Key? key,
    required this.teamModel,
    required this.collectionId,
  }) : super(key: key);

  @override
  State<BottomPlayersSheetWidget> createState() =>
      _BottomPlayersSheetWidgetState();
}

class _BottomPlayersSheetWidgetState extends State<BottomPlayersSheetWidget> {
  late PlayersBloc _playersBloc;

  @override
  void initState() {
    _playersBloc = BlocProvider.of(context);
    _playersBloc.add(GetPlayersEvent(collectionId: widget.collectionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var team = widget.teamModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: ThemeHelper.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          BlocConsumer<PlayersBloc, PlayersState>(
            bloc: _playersBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingPlayersState) {
                return LoadingWidget(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                );
              }

              if (state is LoadedPlayersState) {
                var length = state.playerListModel.playerList?.length ?? 0;
                return Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
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
                      const SizedBox(height: 10),
                      Divider(color: ThemeHelper.grey),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Команда:',
                            style: TextStyleHelper.f18w500,
                          ),
                          Text(
                            'номер',
                            style: TextStyleHelper.f18w500
                                .copyWith(color: ThemeHelper.color08B89D),
                          ),
                        ],
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: length,
                        itemBuilder: (context, index) {
                          var player = state.playerListModel.playerList?[index];
                          var playersNumber = index + 1;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$playersNumber. ${player?.name ?? ''} ${player?.lastName ?? ''}',
                                style: TextStyleHelper.f16w400,
                              ),
                              Text(
                                (player?.playerNumber.toString()) ?? '',
                                style: TextStyleHelper.f16w400,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
