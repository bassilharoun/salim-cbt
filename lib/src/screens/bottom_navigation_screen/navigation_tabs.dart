import 'package:flutter/cupertino.dart';
import 'package:salim_cbt/src/screens/payment/order_screen.dart';
import 'package:salim_cbt/src/screens/profile_screen/profile_screen.dart';

import '../home_screen/home_screen.dart';

class NavigationTabData {
  final IconData iconData;
  final String label;
  final Widget page;

  NavigationTabData(this.iconData, this.label, this.page);
}

var navigationTabsData = [
  NavigationTabData(CupertinoIcons.home, "الرئيسية", const HomeScreen()),
  NavigationTabData(CupertinoIcons.person, "الحساب", const ProfileScreen()),
  NavigationTabData(CupertinoIcons.creditcard, "مدفوعاتك", const Orderscreen()),
];
