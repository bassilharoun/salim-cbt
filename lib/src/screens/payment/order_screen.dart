import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            const SizedBox(height: 20),
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
                  child: SizedBox(
                      height: 153,
                      width: 123,
                      child: Image.asset("assets/images/home_cards/book.jpg")),
                ),
                const SizedBox(width: 10),
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
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          AppText.normalText("Delivery by",
                              fontSize: 16,
                              color: LightThemeData().blackTextColor),
                          const SizedBox(width: 5),
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
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.ticket,
                  size: 38,
                ),
                const SizedBox(width: 10),
                AppText.normalText("Apply Coupons",
                    fontSize: 16, color: LightThemeData().blackTextColor),
                const Spacer(),
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
            const SizedBox(height: 20),
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
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        AppText.normalText(
                          "Order Amount",
                          fontSize: 16,
                          color: LightThemeData().blackTextColor,
                        ),
                        const Spacer(),
                        AppText.normalText("5\$",
                            fontSize: 16,
                            color: LightThemeData().blackTextColor,
                            isBold: true),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      AppText.normalText(
                        "Delivery Fee",
                        fontSize: 16,
                        color: LightThemeData().blackTextColor,
                      ),
                      const Spacer(),
                      AppText.normalText("Free",
                          fontSize: 16,
                          color: LightThemeData().primaryColor,
                          isBold: true),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            myDivider(),
            const SizedBox(height: 40),
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
                        navigateTo(context, const CheckoutPage());
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
