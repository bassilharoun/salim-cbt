import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/screens/payment/checkout_screen.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: AppText.normalText("مدفوعاتك",
                  isBold: true, fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      height: 153,
                      width: 123,
                      child: Image.asset("assets/images/home_cards/book.jpg")),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.normalText("كتاب وداعا للأفكار السلبية",
                          fontSize: 16, isBold: true),
                      AppText.normalText(
                          "دليلك الكامل للتخلص من افكارك السلبية",
                          fontSize: 14,
                          maxLines: 2),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Qty 1",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: LightThemeData().blackTextColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          AppText.normalText("Delivery by",
                              fontSize: 16,
                              color: LightThemeData().blackTextColor),
                          SizedBox(width: 5),
                          AppText.normalText("Just now",
                              fontSize: 16,
                              color: LightThemeData().blackTextColor,
                              isBold: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.ticket,
                  size: 38,
                ),
                SizedBox(width: 10),
                AppText.normalText("Apply Coupons",
                    fontSize: 16, color: LightThemeData().blackTextColor),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Select",
                      style: TextStyle(
                          color: LightThemeData().primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(height: 20),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.normalText("Order Payment Details",
                        fontSize: 18,
                        color: LightThemeData().blackTextColor,
                        isBold: true),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        AppText.normalText(
                          "Order Amount",
                          fontSize: 16,
                          color: LightThemeData().blackTextColor,
                        ),
                        Spacer(),
                        AppText.normalText("5\$",
                            fontSize: 16,
                            color: LightThemeData().blackTextColor,
                            isBold: true),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      AppText.normalText(
                        "Delivery Fee",
                        fontSize: 16,
                        color: LightThemeData().blackTextColor,
                      ),
                      Spacer(),
                      AppText.normalText("Free",
                          fontSize: 16,
                          color: LightThemeData().primaryColor,
                          isBold: true),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
            SizedBox(height: 20),
            myDivider(),
            SizedBox(height: 40),
            cubit.isUserPremium()
                ? SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton("انت بالفعل مشترك",
                        onPressed: null, buttonColor: Colors.grey),
                  )
                : SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton(
                      "أكمل الدفع",
                      onPressed: () {
                        navigateTo(context, CheckoutPage());
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
