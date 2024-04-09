import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/auth/login_screen.dart';
import 'package:salim_cbt/src/screens/my_fears_screen/course_details_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        UserModel userModel = cubit.userModel;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.normalText("Salim",
                        fontSize: 18,
                        color: LightThemeData().primaryColor,
                        isBold: true),
                    SizedBox(
                      width: 5,
                    ),
                    AppText.normalText("CBT",
                        fontSize: 18,
                        color: LightThemeData().blackTextColor,
                        isBold: true),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 60,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userModel.image ??
                        "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: LightThemeData().whiteTextColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: LightThemeData()
                                .blackTextColor
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 17,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.normalText("Personal Info",
                                fontSize: 18,
                                color: LightThemeData().blackTextColor,
                                isBold: true),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                AppText.normalText(
                                  "Your Name",
                                  fontSize: 16,
                                  color: LightThemeData().blackTextColor,
                                ),
                                Spacer(),
                                AppText.normalText(userModel.name!,
                                    fontSize: 16,
                                    color: LightThemeData().blackTextColor,
                                    isBold: true),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              AppText.normalText(
                                "Your Email",
                                fontSize: 16,
                                color: LightThemeData().blackTextColor,
                              ),
                              Spacer(),
                              AppText.normalText(userModel.email!,
                                  fontSize: 16,
                                  color: LightThemeData().blackTextColor,
                                  isBold: true),
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                AppText.normalText(
                                  "password",
                                  fontSize: 16,
                                  color: LightThemeData().blackTextColor,
                                ),
                                Spacer(),
                                AppText.normalText("*********",
                                    fontSize: 16,
                                    color: LightThemeData().blackTextColor,
                                    isBold: true),
                              ],
                            ),
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: LightThemeData().whiteTextColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color:
                              LightThemeData().blackTextColor.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 17,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 128,
                            width: 126,
                            child: Image.asset(
                              "assets/images/categories_background/background_1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  AppText.normalText("مخاوفك",
                                      fontSize: 16,
                                      color: LightThemeData().blackTextColor,
                                      isBold: true),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.pen))
                                ],
                              ),
                              AppText.normalText(
                                userModel.ideas!.length.toString() + " مخاوف",
                                fontSize: 16,
                                color: LightThemeData().primaryColor,
                              ),
                              AppText.normalText(
                                maxLines: 1,
                                "تعرف على مخاوفك وكيف تتغلب عليها",
                                fontSize: 12,
                                color: LightThemeData().bodyTextColor,
                              ),
                              // outline button
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: AppButtons.borderedButton("الاستماع",
                                    buttonColor: LightThemeData().primaryColor,
                                    textColor: LightThemeData().primaryColor,
                                    borderColor: LightThemeData().primaryColor,
                                    onPressed: () {
                                  navigateTo(context, CourseDetailsScreen());
                                }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: LightThemeData().whiteTextColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: LightThemeData()
                                .blackTextColor
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 17,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppText.normalText(
                                  "Dark Mode",
                                  fontSize: 16,
                                  color: LightThemeData().blackTextColor,
                                ),
                                Spacer(),
                                Switch(
                                  value: cubit.isDark,
                                  onChanged: (value) {
                                    cubit.changeThemeMode();
                                  },
                                  activeColor: LightThemeData().primaryColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              AppText.normalText(
                                "Push Notification",
                                fontSize: 16,
                                color: LightThemeData().blackTextColor,
                              ),
                              Spacer(),
                              Switch(
                                value: false,
                                onChanged: (value) {},
                                activeColor: LightThemeData().primaryColor,
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            // text button
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());

                                cubit.logout();
                              },
                              child: AppText.normalText(
                                "Logout",
                                fontSize: 16,
                                color: Colors.red,
                                isBold: true,
                              ),
                            )
                          ]),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
