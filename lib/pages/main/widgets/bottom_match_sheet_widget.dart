import 'package:flutter/material.dart';
import 'package:soccer_app/core/models/matches_model.dart';

import '../../../commons/text_style_helper.dart';
import '../../../commons/theme_helper.dart';

class BottomMatchScheetWidget extends StatefulWidget {
  final MatchesModel matches;

  const BottomMatchScheetWidget({Key? key, required this.matches})
      : super(key: key);

  @override
  State<BottomMatchScheetWidget> createState() =>
      _BottomMatchScheetWidgetState();
}

class _BottomMatchScheetWidgetState extends State<BottomMatchScheetWidget> {
  @override
  Widget build(BuildContext context) {
    var matches = widget.matches;
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
          Padding(
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
                const Text(
                  'Забившие гол:',
                  style: TextStyleHelper.f23w700,
                ),
                const SizedBox(height: 20),
                scoringGoal(
                  team: matches.teamOne,
                  teamLogo: matches.teamOneLogo,
                  goalCount: matches.teamOneGoals,
                ),
                const SizedBox(height: 20),
                Divider(
                  color: ThemeHelper.grey,
                ),
                const SizedBox(height: 20),
                scoringGoal(
                  team: matches.teamTwo,
                  teamLogo: matches.teamTwoLogo,
                  goalCount: matches.teamTwoGoals,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column scoringGoal({
    required String? team,
    required String? teamLogo,
    required int? goalCount,
  }) {
    const defaultImage =
        'https://papik.pro/uploads/posts/2021-11/1636216226_40-papik-pro-p-logotip-futbol-foto-45.jpg';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                teamLogo ?? defaultImage,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              team ?? '',
              style: TextStyleHelper.f18w500,
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, left: 50),
          itemBuilder: (context, index) {
            var countPlayer = index + 1;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$countPlayer. Калыбеков Кайрат',
                  style: TextStyleHelper.f16w500,
                ),
                const SizedBox(width: 20),
                Text(
                  '- 1 гол',
                  style: TextStyleHelper.f16w500
                      .copyWith(color: ThemeHelper.color105BFB),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        ),
      ],
    );
  }
}
