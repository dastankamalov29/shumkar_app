import 'package:flutter/material.dart';
import 'package:soccer_app/core/models/matches_model.dart';
import 'package:soccer_app/pages/main/widgets/bottom_match_sheet_widget.dart';

import '../../../commons/text_style_helper.dart';
import '../../../commons/theme_helper.dart';

class MatchBoxWidget extends StatelessWidget {
  const MatchBoxWidget({
    Key? key,
    required this.matches,
  }) : super(key: key);

  final MatchesModel matches;

  @override
  Widget build(BuildContext context) {
    const defaultImage =
        'https://papik.pro/uploads/posts/2021-11/1636216226_40-papik-pro-p-logotip-futbol-foto-45.jpg';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: ThemeHelper.blueGrey,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        backgroundColor: ThemeHelper.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            matches.match ?? '',
            style: TextStyleHelper.f18w500
                .copyWith(color: ThemeHelper.color08B89D),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      matches.teamOne ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleHelper.f18w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      matches.teamOneLogo ?? defaultImage,
                    ),
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    matches.teamOneGoals.toString(),
                    style: TextStyleHelper.f23w700
                        .copyWith(color: ThemeHelper.color105BFB),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    ':',
                    style: TextStyleHelper.f20w600
                        .copyWith(color: ThemeHelper.color105BFB),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    matches.teamTwoGoals.toString(),
                    style: TextStyleHelper.f23w700
                        .copyWith(color: ThemeHelper.color105BFB),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      matches.teamTwoLogo ?? defaultImage,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 90,
                    child: Text(
                      matches.teamTwo ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleHelper.f18w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      onPressed: () => _showModalBottomSheet(context, matches: matches),
    );
  }

  void _showModalBottomSheet(
    BuildContext context, {
    required MatchesModel matches,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomMatchScheetWidget(matches: matches);
      },
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
