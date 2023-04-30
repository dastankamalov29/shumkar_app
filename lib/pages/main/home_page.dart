import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/commons/theme_helper.dart';
import 'package:soccer_app/core/models/matches_model.dart';
import 'package:soccer_app/pages/main/bloc/matches_bloc.dart';
import 'package:soccer_app/pages/main/widgets/loading_widget.dart';
import 'package:soccer_app/pages/main/widgets/match_box_widget.dart';

import '../../core/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MatchesBloc _matchesBloc;

  @override
  void initState() {
    _matchesBloc = BlocProvider.of(context);
    _matchesBloc.add(GetMatchesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.blueGrey,
      appBar: customAppBar(context, title: 'Матчи'),
      body: RefreshIndicator(
        onRefresh: () async => _matchesBloc.add(GetMatchesEvent()),
        child: BlocConsumer<MatchesBloc, MatchesState>(
          bloc: _matchesBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingMatchesState) {
              return LoadingWidget(
                width: MediaQuery.of(context).size.width,
                height: 100,
                widgetCount: 10,
              );
            }

            if (state is LoadedMatchesState) {
              var length = state.matchesList.matchesList?.length ?? 0;
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                itemCount: length,
                itemBuilder: (context, index) {
                  var matches =
                      state.matchesList.matchesList?[index] ?? MatchesModel();
                  return MatchBoxWidget(matches: matches);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
