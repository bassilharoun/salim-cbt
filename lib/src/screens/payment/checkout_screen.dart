import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/common_widgets/app_buttons.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/components/components.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.1,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  "الدفع",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            SizedBox(height: 20),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText.normalText(
                          "Order",
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        Spacer(),
                        AppText.normalText(
                          "5\$",
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      AppText.normalText(
                        "Shipping",
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      Spacer(),
                      AppText.normalText("Free",
                          fontSize: 16, color: Colors.grey, isBold: true),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      AppText.normalText(
                        "Total",
                        fontSize: 18,
                        color: LightThemeData().blackTextColor,
                      ),
                      Spacer(),
                      AppText.normalText(
                        "5\$",
                        fontSize: 18,
                        color: LightThemeData().blackTextColor,
                      ),
                    ]),
                  ]),
            ),
            SizedBox(height: 20),
            myDivider(),
            SizedBox(height: 20),
            Row(
              children: [
                AppText.normalText(
                  "Payment Method",
                  fontSize: 22,
                  color: LightThemeData().blackTextColor,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: LightThemeData().primaryColor,
              ),
              child: Container(
                margin: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/icons/paypal.png",
                        width: 60,
                        height: 60,
                      ),
                      Spacer(),
                      AppText.normalText(
                        "Paypal",
                        fontSize: 18,
                        color: LightThemeData().blackTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: AppButtons.mainButton(
                "أكمل الدفع",
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                      clientId:
                          "AWFT6Kyje4pD8GUfCKx_YQh5ChCeg61bxE_Yyr8WyZ_rNrXPsZVEMdBY0Q-Uw2SHlHvk4_4e7A_x9mD6",
                      secretKey:
                          "ECHjv49F-0RujbHV1AydI7qQgI080kg6DoI9Y8KZVsQvsLopO8WJOFAVsQIVQTtIxa3352feIQLjKSMf",
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      transactions: const [
                        {
                          "amount": {
                            "total": '5',
                            "currency": "USD",
                            "details": {
                              "subtotal": '5',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "Premium Plan",
                                "quantity": 1,
                                "price": '5',
                                "currency": "USD"
                              },
                            ],
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        AppCubit.get(context).changeUserPremium();
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print("onCancel");
                        Navigator.pop(context);
                      },
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
