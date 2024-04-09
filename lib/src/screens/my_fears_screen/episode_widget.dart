import 'package:flutter/material.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/music_player_screen/sleep_music_player.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class EpisodeWidget extends StatelessWidget {
  final IdeaModel idea;
  final String duration;
  final bool isSelected;
  final bool isPremium;

  const EpisodeWidget({
    Key? key,
    required this.idea,
    required this.duration,
    this.isPremium = false,
    this.isSelected = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          GestureDetector(
            child: getPlayButton(),
            onTap: () => onEpisodeClicked(context),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.normalText(
                  idea.title,
                  maxLines: 2,
                  fontSize: 16,
                ),
                AppText.normalText(
                  duration,
                  fontSize: 11,
                  color: const Color(0xffA1A4B2),
                ),
              ],
            ),
          ),
          if (isPremium)
            Icon(
              Icons.lock,
              color: LightThemeData().bodyTextColor,
            )
        ],
      ),
    );
  }

  Widget getPlayButton() {
    if (isSelected) {
      return const Icon(
        Icons.play_circle_fill,
        size: 40,
        color: Color(0xff8E97FD),
      );
    }
    return Icon(
      Icons.play_circle_outline_rounded,
      color: LightThemeData().bodyTextColor,
      size: 40,
    );
  }

  void onEpisodeClicked(BuildContext context) {
    if (isPremium) {
      showBlurredDialog(
          // premium content dialog
          color: Colors.white,
          context: context,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  AppText.normalText("المحتوى متاح للمشتركين فقط"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.lock,
                    color: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AppText.normalText(
                  "قم بالاشتراك الآن لسماع جميع التسجيلات الصوتية",
                  maxLines: 3,
                  fontSize: 16),
            ],
          ));
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MusicPlayer(
                  idea: idea,
                )),
      );
    }
  }
}
