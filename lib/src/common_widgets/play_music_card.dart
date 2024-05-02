import 'package:flutter/material.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/screens/music_player_screen/sleep_music_player.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class PlayMusicCard extends StatelessWidget {
  final String title;
  final String subText;
  final Color color;

  const PlayMusicCard({
    Key? key,
    required this.title,
    required this.subText,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClicked(context),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: LightThemeData().primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: color,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm, color: color, size: 20),
                        SizedBox(width: 5),
                        Text(
                          subText,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: color,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AppButtons.borderedButton("ادفع الان",
                    buttonColor: LightThemeData().whiteTextColor,
                    onPressed: () {
                  onClicked(context);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClicked(BuildContext context) {
    AppCubit.get(context).changeSelectedIndex(2);
  }
}
