import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/models/models.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    } else {
      isDark = !isDark;
      emit(AppChangeThemeModeState());
    }
  }

  int selectedCategory = 0;

  void changeSelectedCategory(int index) {
    selectedCategory = index;
    emit(AppChangeSelectedCategoryState());
  }

  List<FearModel> fears = [];
  List<FearModel> panics = [];

  List<FearModel> selectedTopics = [];

  Future<void> getFearsData() async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('topics');

      // Get all documents from the collection
      QuerySnapshot querySnapshot = await collectionRef.get();

      // Iterate through each document
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Access the data for each document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Iterate through each field in the document
        if (documentSnapshot.id == "fears") {
          data.forEach((key, value) {
            // print("key: $key");
            fears.add(FearModel.fromJson(value));
            // print(fears.first.ideas["1"]["record"]);
            // print(value);
          });
        }

        if (documentSnapshot.id == "panic") {
          data.forEach((key, value) {
            // print("key: $key");
            panics.add(FearModel.fromJson(value));
            // print(panics.first.ideas["1"]["record"]);
            // print(value);
          });
        }

        print('----------------------');
      }
      print(fears.length);
      print(panics.length);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  List<IdeaModel> ideas = [];
  getIdeasFromFears() {
    for (var element in selectedTopics) {
      element.ideas.forEach((key, value) {
        ideas.add(IdeaModel.fromJson(value));
      });
    }
  }

  // create a function that return a random image from 4 images

  String getRandomImage() {
    var random = Random();
    var images = [
      "assets/images/types/card1.svg",
      "assets/images/types/card2.svg",
      "assets/images/types/card3.svg",
      "assets/images/types/card4.svg",
    ];
    return images[random.nextInt(4)];
  }
}
