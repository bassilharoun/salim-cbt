import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/screens/bottom_navigation_screen/navigation_tabs.dart';
import 'package:salim_cbt/src/themes/theme.dart';

import 'navigation_icon_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.of(context).theme.scaffoldBackgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            currentIndex: cubit.selectedIndex,
            onTap: (newIndex) {
              // Change theme only in sleep page
              // var mode = AppTheme.of(context).theme.mode;

              // todo dark mood
              // if (newIndex == 1 && mode == ThemeMode.light) {
              //   AppTheme.of(context).setMode(ThemeMode.dark);
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const WelcomeSleepScreen()),
              //   );
              // } else if (newIndex != 1 && mode == ThemeMode.dark) {
              //   AppTheme.of(context).setMode(ThemeMode.light);
              // }

              cubit.changeSelectedIndex(newIndex);
            },
            unselectedItemColor: context.theme.unselectedNavTextColor,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
            selectedItemColor: AppTheme.of(context).theme.selectedNavTextColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
            backgroundColor: AppTheme.of(context).theme.scaffoldBackgroundColor,
            type: BottomNavigationBarType.fixed,
            items: navigationTabsData.map((item) {
              int index = navigationTabsData.indexOf(item);
              return BottomNavigationBarItem(
                icon: NavigationIconWidget(
                  icon: item.iconData,
                  isSelected: index == cubit.selectedIndex,
                ),
                label: item.label,
              );
            }).toList(),
          ),
          body: SafeArea(
              child: navigationTabsData.elementAt(cubit.selectedIndex).page),
        );
      },
    );
  }
}
