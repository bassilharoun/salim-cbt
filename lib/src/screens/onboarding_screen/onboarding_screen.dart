import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/components/network/local/cache_helper.dart';
import 'package:salim_cbt/src/screens/welcome_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String image;
  String title;
  String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      navigateAndFinish(context, WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
          image: 'assets/images/icons/onboarding_1.PNG',
          title: "علاج نهائي لنوبات الهلع",
          body:
              "ستتخلص من الخوف ومن جميع الأفكار السلبية المخيفة والتفكير المفرط، وستسيطر على جسدك وردود أفعاله."),
      BoardingModel(
          image: 'assets/images/icons/onboarding_2.PNG',
          title: "راحة نفسية دائمة",
          body:
              "ستتمتع بالهدوء النفسي والسلام الداخلي والتفكير الإيجابي على مدار اليوم وفي جميع المواقف."),
      BoardingModel(
          image: 'assets/images/icons/onboarding_3.PNG',
          title: "المعالج النفسي سليم كيال",
          body:
              "ستخوض تجربة فريدة, سيرافقك المعالج سليم في كل دقيقة, ويساعدك في التفكير بشكل إيجابي, ويخلصك من جميع افكارك السلبية."),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              "Skip",
              style: TextStyle(
                  color: AppTheme.of(context).theme.primaryColor, fontSize: 20),
            ),
            onPressed: () {
              submit();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: AppTheme.of(context).theme.primaryColor,
                    ),
                    controller: boardController,
                    count: 3),
                const Spacer(),
                FloatingActionButton(
                    backgroundColor: AppTheme.of(context).theme.primaryColor,
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.decelerate);
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(model.image), width: 300.w, height: 300.h),
          const Spacer(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              model.title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                model.body,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      );
}
