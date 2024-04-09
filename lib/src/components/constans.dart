import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/components/network/local/cache_helper.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/auth/login_screen.dart';

dynamic uId ;
Locale myLocale = window.locale;

void signOut(context){
  CacheHelper.removeData(key: 'uId').then((value) {
    if(value){
      uId = '';
      AppCubit.get(context).userModel = UserModel.fromJson({});
      navigateAndFinish(context, LoginScreen());
    }
  });
}