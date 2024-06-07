import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/common_widgets/category.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/topics_dummy_data.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/topics_waterfall_widget.dart';
import 'package:salim_cbt/src/screens/ideas_screen/ideas_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

// ignore: must_be_immutable
class ChooseTopicScreen extends StatelessWidget {
  String name;
  String email;
  String password;
  ChooseTopicScreen(this.name, this.email, this.password, {super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: LightThemeData().scaffoldBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
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
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            color: LightThemeData().blackTextColor,
                          ),
                        ),
                      ),
                      AppText.normalText("أختر مخاوفك",
                          fontSize: 22, color: LightThemeData().blackTextColor),
                      // text button
                      TextButton(
                        onPressed: () {
                          // print(cubit.ideas);
                          onNextButtonPressed(context);
                        },
                        child: AppText.normalText(
                          "التالي",
                          fontSize: 16,
                          color: LightThemeData().primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.changeSelectedCategory(index);
                            debugPrint("${cubit.selectedCategory}");
                          },
                          child: CategoryItem(
                              categoryData.keys.elementAt(index),
                              categoryData.values.elementAt(index),
                              index),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 22);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TopicsWaterfallWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onNextButtonPressed(
    BuildContext context,
  ) {
    AppCubit.get(context).getIdeasFromFears().then((value) {
      debugPrint("navigate");

      debugPrint("${AppCubit.get(context).ideas.length}");
      debugPrint("navigate");
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                IdeaScreen(AppCubit.get(context).ideas, name, email, password)),
      );
    });
  }
}
