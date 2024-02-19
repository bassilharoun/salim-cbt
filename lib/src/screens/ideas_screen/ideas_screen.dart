import 'package:flutter/material.dart';
import 'package:salim_cbt/src/app_cubit/app_cubit.dart';
import 'package:salim_cbt/src/models/models.dart';

class IdeaScreen extends StatefulWidget {
  @override
  _IdeaScreentate createState() => _IdeaScreentate();
}

class _IdeaScreentate extends State<IdeaScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit();
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Selection ListView"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cubit.ideas.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        cubit.ideas[index],
                        cubit.ideas[index].isSelected,
                        index,
                      );
                    }),
              ),
              cubit.ideas.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.green[700],
                          child: Text(
                            "Delete (${cubit.ideas.length})",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            print("Delete List Lenght: ${cubit.ideas.length}");
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(IdeaModel idea, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        idea.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      // subtitle: Text(phoneNumber),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
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
            AppCubit.get(context).ideas.add(IdeaModel(
                title: idea.title, record: idea.record, isSelected: true));
          } else if (AppCubit.get(context).ideas[index].isSelected == false) {
            AppCubit.get(context).ideas.removeWhere((element) =>
                element.title == AppCubit.get(context).ideas[index].title);
          }
        });
      },
    );
  }
}
