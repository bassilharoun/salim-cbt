import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/common_widgets/app_text_forms.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/choose_topic_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class SignupScreen extends StatelessWidget {
  static final nameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: LightThemeData().scaffoldBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/backgrounds/upper_light.svg",
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20.1,
                                backgroundColor:
                                    LightThemeData().blackTextColor,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      LightThemeData().whiteTextColor,
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
                              AppText.normalText("أنشئ حسابك الان",
                                  fontSize: 22,
                                  color: LightThemeData().blackTextColor),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: double.maxFinite,
                            child: AppButtons.secondaryButton(
                              "assets/images/icons/facebook.svg",
                              "اكمل بواسطة فيسبوك",
                              textColor: LightThemeData().whiteTextColor,
                              buttonColor: LightThemeData().facebookColor,
                              borderColor: LightThemeData().facebookColor,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SigninScreen()),
                                // );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: double.maxFinite,
                            child: AppButtons.secondaryButton(
                              "assets/images/icons/google.svg",
                              "اكمل بواسطة جوجل",
                              buttonColor: Colors.transparent,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SigninScreen()),
                                // );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: double.maxFinite,
                            child: AppButtons.secondaryButton(
                              "assets/images/icons/apple_black.svg",
                              "اكمل بواسطة ابل",
                              buttonColor: Colors.transparent,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SigninScreen()),
                                // );
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          AppText.normalText("أنشئ حساب من خلال",
                              fontSize: 16,
                              color: LightThemeData().bodyTextColor),
                          SizedBox(height: 30),
                          AppTextForm(nameController, "الأسم بالكامل", (val) {
                            if (val!.isEmpty) {
                              return "الاسم لا يمكن ان يكون فارغ";
                            }
                            return null;
                          }).inputDecoration(),
                          SizedBox(height: 15),
                          AppTextForm(emailController, "البريد الالكتروني",
                              (val) {
                            if (val!.isEmpty || !val.contains("@")) {
                              return "بريد الكتروني غير صحيح";
                            }
                            return null;
                          }).inputDecoration(),
                          SizedBox(height: 15),
                          //pass the validation function to the text form
                          AppTextForm(
                              passwordController,
                              "كلمة المرور",
                              isPassword: cubit.isPassword,
                              suffixIcon: cubit.isPassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined,
                              suffixFunction: () {
                                cubit.changePasswordVisibility();
                                print("isPasswordVisible: ${cubit.isPassword}");
                              },
                              suffixColor: LightThemeData().blackTextColor,
                              (val) {
                                if (val!.isEmpty || val.length < 6) {
                                  return "كلمة المرور يجب ان تكون اكثر من 6 احرف";
                                }
                                return null;
                              }).inputDecoration(),
                          SizedBox(height: 15),
                          //Row with checkbox and text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText.normalText("أوافق على الشروط والأحكام",
                                  fontSize: 14,
                                  color: LightThemeData().bodyTextColor),
                              Spacer(),
                              Checkbox(
                                value: cubit.checkBoxValue,
                                activeColor: LightThemeData().primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  cubit.changeCheckBox(value!);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: double.maxFinite,
                            child: AppButtons.mainButton(
                              "أنشئ حساب",
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    cubit.checkBoxValue) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChooseTopicScreen(
                                              nameController.text,
                                              emailController.text,
                                              passwordController.text,
                                            )),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
