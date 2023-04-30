import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soccer_app/commons/text_style_helper.dart';
import 'package:soccer_app/commons/theme_helper.dart';
import 'package:soccer_app/core/router/app_router.gr.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _navigate() async {
    await Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context).replace(const NavBarRouterRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.color5061FF,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ThemeHelper.color08B89D.withOpacity(0.6),
                        offset:  Offset(1, 1),
                        blurRadius: 60,
                        spreadRadius: 15,
                      ),
                    ],
                  ),
                  child: Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_PC6oezZ3Yk.json',
                    onLoaded: (p0) {
                      _navigate();
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Добро пожаловать в Shumkar App',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.f16w700
                        .copyWith(color: ThemeHelper.white),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Приложение для просмотра футбольных матчей',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.f14w500
                        .copyWith(color: ThemeHelper.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
