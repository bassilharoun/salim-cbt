import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;

import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/models/models.dart';

class MusicPlayerColors {
  final String background;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color iconBackgroundColor;
  final Color iconColor;

  MusicPlayerColors(this.background, this.primaryTextColor,
      this.secondaryTextColor, this.iconBackgroundColor, this.iconColor);
}

var lightMusicPlayerColors = MusicPlayerColors(
  "assets/images/backgrounds/music_background.png",
  const Color(0xff3F414E),
  const Color(0xffA0A3B1),
  const Color(0xffb6b8bf),
  Colors.white,
);

var darkMusicPlayerColors = MusicPlayerColors(
  "assets/images/backgrounds/music_background_sleep.png",
  const Color(0xffE6E7F2),
  const Color(0xff98A1BD),
  const Color(0xff2C4179),
  Colors.white,
);

// ignore: must_be_immutable
class MusicPlayer extends StatefulWidget {
  final bool sleepPlayer;
  IdeaModel idea;

  MusicPlayer({
    Key? key,
    required this.idea,
    this.sleepPlayer = false,
  }) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class PositionData {
  const PositionData(this.position, this.bufferedPosition, this.duration);
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class _MusicPlayerState extends State<MusicPlayer>
    with TickerProviderStateMixin {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setUrl(widget.idea.record);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    MusicPlayerColors musicPlayerColors =
        widget.sleepPlayer ? darkMusicPlayerColors : lightMusicPlayerColors;

    return Scaffold(
      backgroundColor: const Color(0xff03174C),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              musicPlayerColors.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              getHeaderIcons(context, musicPlayerColors),
              const Spacer(
                flex: 2,
              ),
              Lottie.asset(
                "assets/images/breathing/breathing_lottie.json",
                frameRate: FrameRate.max,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                },
              ),
              const Spacer(
                flex: 2,
              ),
              getMusicControls(musicPlayerColors),
              // const Spacer(
              //   flex: 1,
              // ),
              StreamBuilder(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return ProgressBar(
                      baseBarColor: const Color(0xffA0A3B1),
                      bufferedBarColor: const Color(0xffA0A3B1),
                      progressBarColor: const Color(0xff3F414E),
                      thumbColor: const Color(0xff3F414E),
                      progress: positionData?.position ?? Duration.zero,
                      buffered: positionData?.bufferedPosition ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      onSeek: _audioPlayer.seek,
                    );
                  }),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeaderIcons(
      BuildContext context, MusicPlayerColors musicPlayerColors) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const AppIconButton(
            Icons.close,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: AppText.normalText(
            widget.idea.title,
            fontSize: 16,
            // isBold: true,
            color: musicPlayerColors.primaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget getMusicControls(MusicPlayerColors musicPlayerColors) {
    return StreamBuilder(
        stream: _audioPlayer.playerStateStream,
        builder: ((context, snapshot) {
          final playerState = snapshot.data;
          // final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // back 15 seconds

                  _audioPlayer.seek(
                      _audioPlayer.position - const Duration(seconds: 15));
                },
                child: Stack(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: const ChangePlayBackIcon(
                        color: Colors.grey,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: AppText.normalText(
                          "15",
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 50),
              !(playing ?? false)
                  ? IconButton(
                      onPressed: () {
                        setState(() {});
                        _controller.repeat();

                        _audioPlayer.play();
                      },
                      icon: Icon(
                        Icons.play_circle_fill,
                        size: 80,
                        color: musicPlayerColors.primaryTextColor,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {});
                        _controller.stop();
                        _audioPlayer.pause();
                      },
                      icon: Icon(
                        Icons.pause_circle_filled,
                        size: 80,
                        color: musicPlayerColors.primaryTextColor,
                      ),
                    ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  // forward 15 seconds
                  _audioPlayer.seek(
                      _audioPlayer.position + const Duration(seconds: 15));
                },
                child: Stack(
                  children: [
                    const ChangePlayBackIcon(
                      color: Colors.grey,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: AppText.normalText(
                          "15",
                          fontSize: 10,
                          color: const Color(0xff98A1BD),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }));
  }
}

// class LightMusicPlayer extends StatefulWidget {
//   const LightMusicPlayer({Key? key}) : super(key: key);

//   @override
//   _LightMusicPlayerState createState() => _LightMusicPlayerState();
// }

// class _LightMusicPlayerState extends State<LightMusicPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     return MusicPlayer();
//   }
// }

// class SleepMusicPlayer extends StatelessWidget {
//   const SleepMusicPlayer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const LightMusicPlayer();
//   }
// }

class AppIconButton extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;

  final Color iconColor;

  final double size;

  const AppIconButton(
    this.iconData, {
    Key? key,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Icon(
        iconData,
        size: size,
        color: iconColor,
      ),
    );
  }
}

class ChangePlayBackIcon extends StatelessWidget {
  final Color color;
  const ChangePlayBackIcon({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.refresh,
      size: 60,
      color: color,
    );
  }
}

class ForwardWidget extends StatelessWidget {
  final Color color;
  const ForwardWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: ChangePlayBackIcon(
              color: color,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: AppText.normalText(
                "15",
                fontSize: 10,
                color: color,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  final Color color;
  const BackWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangePlayBackIcon(
          color: color,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: AppText.normalText(
              "15",
              fontSize: 10,
              color: const Color(0xff98A1BD),
            ),
          ),
        )
      ],
    );
  }
}
