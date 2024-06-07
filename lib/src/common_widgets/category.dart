import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/themes/theme.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String categoryName;
  String categoryIcon;
  int index;

  CategoryItem(this.categoryName, this.categoryIcon, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Column(
      children: [
        Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: index == cubit.selectedCategory
                  ? LightThemeData().primaryColor
                  : LightThemeData().bodyTextColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                width: 26,
                height: 26,
                categoryIcon,
              ),
            )),
        const SizedBox(height: 10),
        AppText.normalText(categoryName,
            maxLines: 4,
            fontSize: 14,
            color: index == cubit.selectedCategory
                ? LightThemeData().blackTextColor
                : LightThemeData().bodyTextColor),
      ],
    );
  }
}
