
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class TwoSvgSwitcher extends StatefulWidget {
  final List<String> assetPaths;
  bool? isBreathing;
  int _currentIndex = 0;

  TwoSvgSwitcher({
    Key? key,
    this.assetPaths = const [
      "assets/images/breathing/breathing_lottie.json",
      "assets/images/breathing/breathing_image.png",
    ],
    this.isBreathing = true,
  }) : super(key: key);

  void startBreathing() {
    isBreathing = true;
    _currentIndex = 0;
  }

  void stopBreathing() {
    isBreathing = false;
    _currentIndex = 1;
  }

  @override
  State<TwoSvgSwitcher> createState() => _TwoSvgSwitcherState();
}

class _TwoSvgSwitcherState extends State<TwoSvgSwitcher> {
  @override
  void initState() {
    super.initState();
    widget.startBreathing();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.assetPaths.contains("json")) ...[
          // Add Lottie animation
          Lottie.asset(
            "assets/images/breathing/breathing_lottie.json",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ] else if (widget.assetPaths.contains("png")) ...[
          // Add image
          Image.asset(
            "assets/images/breathing/breathing_image.png",
            fit: BoxFit.cover,
          ),
        ],

        // SvgPicture.asset(
        //   widget.assetPaths[_currentIndex],
        //   fit: BoxFit.cover,
        // ),
        const SizedBox(height: 10), // Add spacing between image and timer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.timer,
              size: 24,
            ),
            // SizedBox(width: 5),
            // Text(
            //   _remainingTime.inSeconds.toString(), // Get and format time string
            //   style: TextStyle(
            //     fontSize: 24,
            //   ),
            // ),
            // SizedBox(width: 30),
            // add breath in and out text
            Text(
              widget._currentIndex == 0 ? "شهيق" : "زفير",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
