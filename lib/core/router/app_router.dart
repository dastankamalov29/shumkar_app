import 'package:auto_route/annotations.dart';
import 'package:soccer_app/core/router/nav_bar_router.dart';
import 'package:soccer_app/pages/main/home_page.dart';
import 'package:soccer_app/pages/news_list/news_list_page.dart';
import 'package:soccer_app/pages/news_list/news_page.dart';
import 'package:soccer_app/pages/soccer_fields_list/soccer_fields_list_page.dart';
import 'package:soccer_app/pages/splash/splash_page.dart';
import 'package:soccer_app/pages/team_list/team_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashPage, initial: true),
    AutoRoute(
      path: 'navbar',
      page: NavBarRouter,
      children: [
        AutoRoute(path: 'home', page: HomePage),
        AutoRoute(path: 'newsList', page: NewsListPage),
        AutoRoute(path: 'soccerFieldsList', page: SoccerFieldsListPage),
        AutoRoute(path: 'teamList', page: TeamListPage),
      ],
    ),
    AutoRoute(path: 'news', page: NewsPage),
  ],
)
class $AppRouter {}
