import 'package:flutter/material.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/components/constans.dart';
import 'package:salim_cbt/src/components/network/local/cache_helper.dart';
import 'package:salim_cbt/src/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:salim_cbt/src/screens/onboarding_screen/onboarding_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _getData() async {
    AppCubit.get(context).getFearsData();
    await AppCubit.get(context).getAdvertisementData();
    Widget widget;
    uId = await CacheHelper.getData(key: 'uId');
    if (uId != null) {
      // ignore: use_build_context_synchronously
      AppCubit.get(context).getUserData().then((value) {
        widget = const BottomNavigationScreen();
        _goNext(widget);
      });
    } else {
      widget = OnBoardingScreen();
      _goNext(widget);
    }
    // AppCubit.get(context).getProducts(context).then((value) {
    //   AppCubit.get(context).getCartItems(context).then((value) {
    //     _goNext(widget);
    //   });
    // });
  }

  _goNext(Widget widget) {
    navigateAndFinish(context, widget);
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SizedBox(
        width: double.infinity,
        child: Image(
          image: AssetImage("assets/app_icon/app_icon.png"),
          fit: BoxFit.cover,
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
