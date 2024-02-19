import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/app_cubit/app_states.dart';
import 'package:salim_cbt/src/models/models.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/topic_card_widget.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/topics_dummy_data.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class TopicsWaterfallWidget extends StatefulWidget {
  @override
  State<TopicsWaterfallWidget> createState() => _TopicsWaterfallWidgetState();
}

class _TopicsWaterfallWidgetState extends State<TopicsWaterfallWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return WaterfallFlow.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 15.0,
            ),
            itemCount: cubit.selectedCategory == 0
                ? cubit.panics.length + cubit.fears.length
                : (cubit.selectedCategory == 1
                    ? cubit.panics.length
                    : cubit.fears.length),
            itemBuilder: (BuildContext context, int index) {
              List<FearModel> allList = cubit.panics + cubit.fears;
              FearModel fear = cubit.selectedCategory == 0
                  ? allList[index]
                  : (cubit.selectedCategory == 1
                      ? cubit.panics[index]
                      : cubit.fears[index]);
              return GestureDetector(
                onTap: () => onTopicClicked(fear, cubit),
                child: TopicCardWidget(
                  fear,
                  isSelected: cubit.selectedTopics.contains(fear),
                ),
              );
            },
          );
        });
  }

  void onTopicClicked(FearModel fear, AppCubit cubit) {
    if (cubit.selectedTopics.contains(fear)) {
      cubit.selectedTopics.remove(fear);
    } else {
      cubit.selectedTopics.add(fear);
    }
    setState(() {});
  }
}
