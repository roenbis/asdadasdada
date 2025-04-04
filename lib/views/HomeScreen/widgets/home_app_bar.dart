import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qazquery/helpers/auth_helper.dart';
import 'package:qazquery/utils/assets_manager.dart';
import 'package:qazquery/utils/themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: AuthHelper.getName(),
                  builder: (context, snapshot) {
                    return TextFormat.bold(
                      text: 'Сәлем ${snapshot.data ?? 'User'},',
                      textColor: Colors.white,
                    );
                  },
                ),
                TextFormat.small(
                  text: "Оқуды бастаймыз",
                  fontWeight: FontWeight.w300,
                  textColor: Colors.white,
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(SvgManager.avatar),
            )
          ],
        )
      ],
    );
  }
}
