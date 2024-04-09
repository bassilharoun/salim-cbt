import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TwoSvgSwitcher extends StatefulWidget {
  final List<String> svgAssetPaths; // List of SVG asset paths
  final Duration firstImageDelay; // Delay for first image change
  final Duration secondImageDelay; // Delay for second image change

  const TwoSvgSwitcher({
    Key? key,
    required this.svgAssetPaths,
    this.firstImageDelay = const Duration(seconds: 6),
    this.secondImageDelay = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  State<TwoSvgSwitcher> createState() => _TwoSvgSwitcherState();
}

class _TwoSvgSwitcherState extends State<TwoSvgSwitcher> {
  int _currentIndex = 0; // Current SVG index
  Timer? _timer;
  Duration _remainingTime = const Duration(); // Stores remaining time

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _remainingTime = widget.firstImageDelay;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _remainingTime -= const Duration(milliseconds: 100);
        if (_remainingTime.inMicroseconds <= 0) {
          _switchImage();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _switchImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.svgAssetPaths.length;
      if (_currentIndex == 0) {
        _remainingTime = widget.firstImageDelay;
      } else {
        _remainingTime = widget.secondImageDelay;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          widget.svgAssetPaths[_currentIndex],
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10), // Add spacing between image and timer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.timer,
              size: 24,
            ),
            SizedBox(width: 5),
            Text(
              _remainingTime.inSeconds.toString(), // Get and format time string
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(width: 30),
            // add breath in and out text
            Text(
              _currentIndex == 0 ? "شهيق" : "زفير",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
