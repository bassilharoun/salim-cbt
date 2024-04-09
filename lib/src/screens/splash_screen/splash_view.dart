import 'package:flutter/material.dart';
import 'package:salim_cbt/main.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/components/constans.dart';
import 'package:salim_cbt/src/components/network/local/cache_helper.dart';
import 'package:salim_cbt/src/screens/auth/login_screen.dart';
import 'package:salim_cbt/src/screens/bottom_navigation_screen/bottom_navigation_screen.dart';

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
      AppCubit.get(context).getUserData().then((value) {
        widget = BottomNavigationScreen();
        _goNext(widget);
      });
    } else {
      widget = AppStartingPage();
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
    return Scaffold(
      body: Center(
          child: Container(
        width: double.infinity,
        child: const Image(
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
