import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_images.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/common_widgets/favorites_widget.dart';
import 'package:salim_cbt/src/common_widgets/listening_widget.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/themes/theme.dart';

import 'episode_widget.dart';
import 'voices_tab_widget.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        UserModel user = cubit.userModel;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    AppImages.roundedContainerWithImage(
                      "assets/images/backgrounds/your_fear_background2.png",
                      height: 250,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 50,
                              horizontal: 20,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.normalText(
                        "مخاوفك",
                        fontSize: 34,
                      ),
                      AppText.normalText("${user.ideas!.length} مخاوف",
                          fontSize: 14, color: const Color(0xffA1A4B2)),
                      const SizedBox(
                        height: 20,
                      ),
                      // for (int i = 0; i < user.ideas.length; i++)
                      //   AppText.normalText(
                      //     user.ideas[i].title,
                      //     fontSize: 16,
                      //     color: const Color(0xffA1A4B2),
                      //     textAlign: TextAlign.left,
                      //   ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(children: [
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    AppText.normalText(
                                      "التسجيلات",
                                      fontSize: 16,
                                      color: AppTheme.of(context)
                                          .theme
                                          .primaryColor,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppTheme.of(context)
                                              .theme
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 3,
                                      width: 50,
                                    ),
                                  ],
                                ),
                              ]),
                            ),

                            Divider(
                              height: 0.1,
                              color: AppTheme.of(context)
                                  .theme
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                            // Tab(
                            //   child: AppText.normalText(
                            //     "Female Voice",
                            //     fontSize: 16,
                            //     isBold: true,
                            //     color: AppTheme.of(context).theme.primaryColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return EpisodeWidget(
                            idea: user.ideas![index],
                            duration: "5 MIN",
                            isSelected: true,
                            isPremium: cubit.isUserPremium()
                                ? false
                                : (index > 2 ? true : false),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 0.1,
                            color: Colors.grey.withOpacity(0.2),
                          );
                        },
                        itemCount: user.ideas!.length,
                      ),
                      // Expanded(
                      //   child: VoicesTab(
                      //     tabOne:
                      //   ),
                      // ),
                      // ),
                      // SizedBox(
                      //   height: 500,
                      //   child: VoicesTab(
                      //     tabOne: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: const [
                      //         EpisodeWidget(
                      //           title: "Focus Attention",
                      //           duration: "10 MIN",
                      //           isSelected: true,
                      //         ),
                      //         Divider(
                      //           height: 1,
                      //         ),
                      //         EpisodeWidget(
                      //           title: "Body Scan",
                      //           duration: "5 MIN",
                      //         ),
                      //         Divider(
                      //           height: 1,
                      //         ),
                      //         EpisodeWidget(
                      //           title: "Making Happiness",
                      //           duration: "3 MIN",
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
