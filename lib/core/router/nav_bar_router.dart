import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/core/router/app_router.gr.dart';

import '../../commons/icon_helper.dart';
import '../../commons/theme_helper.dart';

class NavBarRouter extends StatefulWidget {
  const NavBarRouter({Key? key}) : super(key: key);

  @override
  State<NavBarRouter> createState() => _NavBarRouterState();
}

class _NavBarRouterState extends State<NavBarRouter> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomePageRoute(),
        NewsListPageRoute(),
        SoccerFieldsListPageRoute(),
        TeamListPageRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: ThemeHelper.color08B89D,
            unselectedItemColor: ThemeHelper.colorA0D39F,
            selectedIconTheme:
                const IconThemeData(color: ThemeHelper.color08B89D),
            unselectedIconTheme:
                const IconThemeData(color: ThemeHelper.colorA0D39F),
            items: const [
              BottomNavigationBarItem(
                label: 'Матчи',
                icon: ImageIcon(
                  AssetImage(IconHelper.match),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Новости',
                icon: ImageIcon(
                  AssetImage(IconHelper.news),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Поля',
                icon: ImageIcon(
                  AssetImage(IconHelper.soccerField),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Команды',
                icon: ImageIcon(
                  AssetImage(IconHelper.team),
                ),
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
