import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class IdeaScreen extends StatefulWidget {
  String name;
  String email;
  String password;
  List<IdeaModel> ideas = [];
  IdeaScreen(this.ideas, this.name, this.email, this.password);
  @override
  _IdeaScreentate createState() => _IdeaScreentate();
}

class _IdeaScreentate extends State<IdeaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppSignupSuccessState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
            (route) => false);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: LightThemeData().scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              child: Column(
                children: [
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
                      AppText.normalText("أختر افكارك",
                          fontSize: 22, color: LightThemeData().blackTextColor),
                      // text button
                      SizedBox()
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.ideas.length,
                        itemBuilder: (BuildContext context, int index) {
                          // return item
                          return IdeaItem(
                            widget.ideas[index],
                            widget.ideas[index].isSelected,
                            index,
                          );
                        }),
                  ),
                  widget.ideas.length > 0
                      ? SizedBox(
                          width: double.infinity,
                          child: AppButtons.mainButton(
                              state is AppSignupLoadingState
                                  ? "جاري التحميل..."
                                  : "أبدأ رحلتك", onPressed: () {
                            AppCubit.get(context).signUpWithEmailAndPassword(
                                widget.email, widget.password, widget.name);
                          }),
                        )
                      : Container(
                          child: Center(
                            child: Text("لا يوجد افكار لعرضها"),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget IdeaItem(IdeaModel idea, bool isSelected, int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      // leading: CircleAvatar(
      //   backgroundColor: LightThemeData().primaryColor,
      //   child: Icon(
      //     Icons.person_add_disabled,
      //     color: Colors.white,
      //   ),
      // ),
      title: Text(
        idea.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: LightThemeData().primaryColor,
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          AppCubit.get(context).ideas[index].isSelected =
              !AppCubit.get(context).ideas[index].isSelected;
          if (AppCubit.get(context).ideas[index].isSelected == true) {
            AppCubit.get(context).selectedIdeas.add(IdeaModel(
                title: idea.title, record: idea.record, isSelected: true));
          } else if (AppCubit.get(context).ideas[index].isSelected == false) {
            AppCubit.get(context).selectedIdeas.removeWhere((element) =>
                element.title == AppCubit.get(context).ideas[index].title);
          }
        });
        print(AppCubit.get(context).selectedIdeas.length);
      },
    );
  }
}
