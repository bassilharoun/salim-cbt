import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class TopicCardWidget extends StatelessWidget {
  final FearModel fear;
  final bool isSelected;

  final double radius = 10.0;

  const TopicCardWidget(
    this.fear, {
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SvgPicture.asset(
            AppCubit.get(context).getRandomImage(),
            fit: BoxFit.fill,
          ),
        ),
        if (isSelected)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        if (isSelected)
          const Positioned(
            bottom: 5,
            right: 5,
            child: Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          ),
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                AppText.normalText(
                  fear.title,
                  isBold: true,
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  color: LightThemeData().whiteTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
