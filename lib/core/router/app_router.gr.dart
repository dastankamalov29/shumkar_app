// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../pages/main/home_page.dart' as _i4;
import '../../pages/news_list/news_list_page.dart' as _i5;
import '../../pages/news_list/news_page.dart' as _i3;
import '../../pages/soccer_fields_list/soccer_fields_list_page.dart' as _i6;
import '../../pages/splash/splash_page.dart' as _i1;
import '../../pages/team_list/team_list_page.dart' as _i7;
import '../models/news_model.dart' as _i10;
import 'nav_bar_router.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    NavBarRouterRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.NavBarRouter(),
      );
    },
    NewsPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewsPageRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.NewsPage(
          key: args.key,
          newsModel: args.newsModel,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    NewsListPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NewsListPage(),
      );
    },
    SoccerFieldsListPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SoccerFieldsListPage(),
      );
    },
    TeamListPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.TeamListPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i8.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i8.RouteConfig(
          NavBarRouterRoute.name,
          path: 'navbar',
          children: [
            _i8.RouteConfig(
              HomePageRoute.name,
              path: 'home',
              parent: NavBarRouterRoute.name,
            ),
            _i8.RouteConfig(
              NewsListPageRoute.name,
              path: 'newsList',
              parent: NavBarRouterRoute.name,
            ),
            _i8.RouteConfig(
              SoccerFieldsListPageRoute.name,
              path: 'soccerFieldsList',
              parent: NavBarRouterRoute.name,
            ),
            _i8.RouteConfig(
              TeamListPageRoute.name,
              path: 'teamList',
              parent: NavBarRouterRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          NewsPageRoute.name,
          path: 'news',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i8.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.NavBarRouter]
class NavBarRouterRoute extends _i8.PageRouteInfo<void> {
  const NavBarRouterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavBarRouterRoute.name,
          path: 'navbar',
          initialChildren: children,
        );

  static const String name = 'NavBarRouterRoute';
}

/// generated route for
/// [_i3.NewsPage]
class NewsPageRoute extends _i8.PageRouteInfo<NewsPageRouteArgs> {
  NewsPageRoute({
    _i9.Key? key,
    required _i10.NewsModel newsModel,
  }) : super(
          NewsPageRoute.name,
          path: 'news',
          args: NewsPageRouteArgs(
            key: key,
            newsModel: newsModel,
          ),
        );

  static const String name = 'NewsPageRoute';
}

class NewsPageRouteArgs {
  const NewsPageRouteArgs({
    this.key,
    required this.newsModel,
  });

  final _i9.Key? key;

  final _i10.NewsModel newsModel;

  @override
  String toString() {
    return 'NewsPageRouteArgs{key: $key, newsModel: $newsModel}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomePageRoute extends _i8.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: 'home',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i5.NewsListPage]
class NewsListPageRoute extends _i8.PageRouteInfo<void> {
  const NewsListPageRoute()
      : super(
          NewsListPageRoute.name,
          path: 'newsList',
        );

  static const String name = 'NewsListPageRoute';
}

/// generated route for
/// [_i6.SoccerFieldsListPage]
class SoccerFieldsListPageRoute extends _i8.PageRouteInfo<void> {
  const SoccerFieldsListPageRoute()
      : super(
          SoccerFieldsListPageRoute.name,
          path: 'soccerFieldsList',
        );

  static const String name = 'SoccerFieldsListPageRoute';
}

/// generated route for
/// [_i7.TeamListPage]
class TeamListPageRoute extends _i8.PageRouteInfo<void> {
  const TeamListPageRoute()
      : super(
          TeamListPageRoute.name,
          path: 'teamList',
        );

  static const String name = 'TeamListPageRoute';
}
