import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/common_widgets/app_text_forms.dart';
import 'package:salim_cbt/src/screens/auth/signup_screen.dart';
import 'package:salim_cbt/src/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:salim_cbt/src/screens/home_screen/home_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeData().scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/backgrounds/upper_light.svg",
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20.1,
                          backgroundColor: LightThemeData().blackTextColor,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: LightThemeData().whiteTextColor,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                              ),
                              color: LightThemeData().blackTextColor,
                            ),
                          ),
                        ),
                        AppText.normalText("اهلا بعودتك",
                            fontSize: 22,
                            color: LightThemeData().blackTextColor),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.maxFinite,
                      child: AppButtons.secondaryButton(
                        "assets/images/icons/facebook.svg",
                        "اكمل بواسطة فيسبوك",
                        textColor: LightThemeData().whiteTextColor,
                        buttonColor: LightThemeData().facebookColor,
                        borderColor: LightThemeData().facebookColor,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => SigninScreen()),
                          // );
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      child: AppButtons.secondaryButton(
                        "assets/images/icons/google.svg",
                        "اكمل بواسطة جوجل",
                        buttonColor: Colors.transparent,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => SigninScreen()),
                          // );
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      child: AppButtons.secondaryButton(
                        "assets/images/icons/apple_black.svg",
                        "اكمل بواسطة ابل",
                        buttonColor: Colors.transparent,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => SigninScreen()),
                          // );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    AppText.normalText("او سجل الدخول من خلال",
                        fontSize: 16, color: LightThemeData().bodyTextColor),
                    SizedBox(height: 30),
                    AppTextForm(emailController, "البريد الالكتروني")
                        .inputDecoration(),
                    SizedBox(height: 15),
                    AppTextForm(passwordController, "كلمة المرور")
                        .inputDecoration(),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      child: AppButtons.mainButton(
                        "تسجيل الدخول",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigationScreen()),
                          );
                        },
                      ),
                    ),
                    // Row with dont have account text and signup button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                          child: AppText.normalText("انشئ حساب",
                              fontSize: 16,
                              color: LightThemeData().primaryColor),
                        ),
                        AppText.normalText("ليس لديك حساب؟",
                            fontSize: 16,
                            color: LightThemeData().bodyTextColor),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
