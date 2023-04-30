import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/pages/main/bloc/matches_bloc.dart';
import 'package:soccer_app/pages/news_list/bloc/news_bloc.dart';
import 'package:soccer_app/pages/soccer_fields_list/bloc/soccer_fields_bloc.dart';
import 'package:soccer_app/pages/team_list/player_bloc/players_bloc.dart';
import 'package:soccer_app/pages/team_list/team_bloc/team_bloc.dart';
import 'core/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => TeamBloc(),
        ),
        BlocProvider(
          create: (context) => PlayersBloc(),
        ),
        BlocProvider(
          create: (context) => SoccerFieldsBloc(),
        ),
        BlocProvider(
          create: (context) => MatchesBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Soccer App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Montserrat',
        ),
        routeInformationParser: _appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
