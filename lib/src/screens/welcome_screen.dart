import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_logo.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/screens/auth/login_screen.dart';
import 'package:salim_cbt/src/screens/auth/signup_screen.dart';
import 'package:salim_cbt/src/screens/welcome_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              width: double.maxFinite,
              image: AssetImage(
                "assets/images/backgrounds/welcome_light_background.png",
              ),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.normalText("Salim CBT",
                      fontSize: 22, color: LightThemeData().whiteTextColor),
                  SizedBox(height: 30),
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    child: Image(
                      image: AssetImage(
                        "assets/images/icons/logo_welcome.png",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  AppText.normalText("Salim CBT اهلا بك في",
                      fontSize: 22, color: LightThemeData().blackTextColor),
                  SizedBox(height: 15),
                  Container(
                    width: 270,
                    child: AppText.normalText(
                        "دعنا نساعدك في التخلص من الخوف والقلق والعيش في هدوء واستقرار",
                        fontSize: 14,
                        color: LightThemeData().blackTextColor),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton(
                      "أبدأ",
                      onPressed: () {
                        onProceedPressed(context);
                      },
                      buttonColor: const Color(0xff8E97FD),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onProceedPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
