import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class YouTubePlayerScreen extends StatelessWidget {
  dynamic videoId;

  YouTubePlayerScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Dialog(
      child: SizedBox(
        width: double.infinity,
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          onReady: () {
            debugPrint('Player is ready.');
          },
        ),
      ),
    );
  }
}
