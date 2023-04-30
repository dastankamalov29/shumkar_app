import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../commons/theme_helper.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required this.width,
    required this.height,
    this.widgetCount = 4,
  }) : super(key: key);

  final double width;
  final double height;
  final int widgetCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      baseColor: ThemeHelper.white,
      highlightColor: ThemeHelper.grey,
      child: ListView.separated(
        itemCount: widgetCount,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        itemBuilder: (context, index) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: ThemeHelper.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }
}
