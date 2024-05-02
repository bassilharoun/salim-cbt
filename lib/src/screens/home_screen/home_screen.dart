import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/common_widgets/play_music_card.dart';
import 'package:salim_cbt/src/screens/home_screen/player/video_player.dart';
import 'package:salim_cbt/src/screens/home_screen/recommended_card_widget.dart';
import 'package:salim_cbt/src/screens/home_screen/recommended_music_dummy_data.dart';
import 'package:salim_cbt/src/themes/theme.dart';

import 'home_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                AppText.normalText(
                  "${cubit.userModel!.name} ,أهلا ",
                  fontSize: 28,
                  color: LightThemeData().blackTextColor,
                ),
                AppText.normalText(
                  "خذ نفسا عميقا وابدأ رحلتك في التخلص من خوفك",
                  fontSize: 16,
                  color: LightThemeData().blackTextColor,
                ),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "${cubit.advertisementModel.thumbnail}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0)),
                          ),
                        ),
                      ),
                    ),
                    // add play button
                    Positioned(
                      top: 60,
                      left: 140,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return YouTubePlayerScreen(
                                videoId: "${cubit.advertisementModel!.video}",
                              );
                            },
                          );
                        },
                        icon: Icon(
                          CupertinoIcons.play_circle,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const PlayMusicCard(
                  title: "اشترك لتستمتع بجميع الصوتيات",
                  subText: "5 \$ : لفترة محدودة",
                  color: Colors.white,
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: LightThemeData().whiteTextColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                height: 153,
                                width: 123,
                                child: Image.asset(
                                    "assets/images/home_cards/book.jpg")),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.normalText("كتاب وداعا للأفكار السلبية",
                                  fontSize: 16, isBold: true),
                              AppText.normalText(
                                  "دليلك الكامل للتخلص من افكارك السلبية",
                                  fontSize: 13),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.alarm,
                                      color: LightThemeData().primaryColor,
                                      size: 20),
                                  SizedBox(width: 5),
                                  Text(
                                    "5 \$ : لفترة محدودة",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: LightThemeData().primaryColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (var i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      color: LightThemeData().starColor,
                                      size: 15,
                                    ),
                                  SizedBox(width: 5),
                                  Text(
                                    "263",
                                    style: TextStyle(
                                        color: LightThemeData().bodyTextColor,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppButtons.borderedButton("ادفع الان",
                                      buttonColor:
                                          LightThemeData().primaryColor,
                                      textColor: LightThemeData().primaryColor,
                                      borderColor: LightThemeData()
                                          .primaryColor, onPressed: () {
                                    cubit.changeSelectedIndex(2);
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
