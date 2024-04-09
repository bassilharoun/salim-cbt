import 'package:flutter/material.dart';
import 'package:salim_cbt/src/common_widgets/app_text.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class VoicesTab extends StatelessWidget {
  final Widget tabOne;
  // final Widget tabTwo;

  const VoicesTab({
    Key? key,
    required this.tabOne,
    // required this.tabTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppTheme.of(context).theme.primaryColor,
              tabs: [
                Container(
                  child: Tab(
                    child: AppText.normalText(
                      "التسجيلات",
                      fontSize: 16,
                      color: AppTheme.of(context).theme.primaryColor,
                    ),
                  ),
                ),
                // Tab(
                //   child: AppText.normalText(
                //     "Female Voice",
                //     fontSize: 16,
                //     isBold: true,
                //     color: AppTheme.of(context).theme.primaryColor,
                //   ),
                // ),
              ],
            ),
          ),
          Divider(
            height: 0.1,
            color: AppTheme.of(context).theme.primaryColor.withOpacity(0.5),
          ),
          TabBarView(
            children: [
              tabOne,
              // tabTwo,
            ],
          ),
        ],
      ),
    );
  }
}
