import 'package:flutter/material.dart';

import '../../commons/text_style_helper.dart';
import '../../commons/theme_helper.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    iconTheme: const IconThemeData(color: ThemeHelper.white),
    title: Text(
      title,
      style: TextStyleHelper.f25w700.copyWith(
        color: ThemeHelper.white,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    flexibleSpace: ClipPath(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const  [
              ThemeHelper.color08B89D,
              ThemeHelper.color5061FF,
            ],
          ),
        ),
      ),
    ),
  );
}
