import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salim_cbt/src/components/constans.dart';
import 'package:salim_cbt/src/components/network/local/cache_helper.dart';
import 'package:salim_cbt/src/models/models.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

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
    getRandomImages(selectedCategory == 0 || selectedCategory == 3
        ? fears.length + panics.length
        : (selectedCategory == 1 ? panics.length : fears.length));
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
      getRandomImages(fears.length + panics.length);
      print(fears.length);
      print(panics.length);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  List<IdeaModel> ideas = [];
  List<IdeaModel> selectedIdeas = [];
  Future getIdeasFromFears() async {
    ideas.clear();
    selectedIdeas.clear();
    // print("selectedTopics: $selectedTopics");
    for (var element in selectedTopics) {
      // print("element: $element");
      element.ideas.forEach((key, value) {
        // print(value);
        ideas.add(IdeaModel.fromJson(value));
        print("value: $value");
        print(ideas.length);
        print(ideas.first.title);
      });
    }
  }

  // create a function that return a random image from 4 images

  // create a function that fill list of random images for each item in the list

  List<String> randomImages = [];
  List<String> getRandomImages(int length) {
    var random = Random();
    var images = [
      "assets/images/types/card1.svg",
      "assets/images/types/card2.svg",
      "assets/images/types/card3.svg",
      "assets/images/types/card4.svg",
    ];
    for (var i = 0; i < length; i++) {
      randomImages.add(images[random.nextInt(4)]);
    }
    return randomImages;
  }

  AdvertisementModel advertisementModel = AdvertisementModel();
  Future getAdvertisementData() async {
    emit(AppGetAdvertisementDataLoadingState());
    // get image from cloud firestore from the advertisement collection then advertisement document
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('advertisement');

      DocumentReference documentRef = collectionRef.doc('advertisement');
      await documentRef.get().then((value) {
        advertisementModel =
            AdvertisementModel.fromJson(value.data() as Map<String, dynamic>);
        print(advertisementModel.thumbnail);
      });
    } catch (e) {
      emit(AppGetAdvertisementDataErrorState());
      print(e);
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  bool checkBoxValue = false;
  void changeCheckBox(bool value) {
    checkBoxValue = value;
    emit(AppChangeCheckBoxState());
  }

  // login with email and password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(AppLoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        uId = value.user!.uid;
        await getUserData();

        emit(AppLoginSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        const SnackBar(content: Text('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        const SnackBar(content: Text('Wrong password provided for that user.'));
      }
      emit(AppLoginErrorState());
      print(e);
      const SnackBar(content: Text('invalid data.'));
    }
  }

  // signup with email and password and save user data in cloud firestore
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(AppSignupLoadingState());
    if (selectedIdeas.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          // save user data in cloud firestore
          CollectionReference collectionRef =
              FirebaseFirestore.instance.collection('users');
          collectionRef.doc(value.user!.uid).set({
            'name': name,
            'email': email,
            'ideas': selectedIdeas.map((e) => e.toJson()).toList(),
            'uId': value.user!.uid,
            'image': '',
            'isPremium': false,
          }).then((val) async {
            CacheHelper.saveData(key: 'uId', value: value.user!.uid);
            uId = value.user!.uid;
            await getUserData();

            emit(AppSignupSuccessState());
          });
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          const SnackBar(content: Text('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          const SnackBar(
              content: Text('The account already exists for that email.'));
        }
        emit(AppSignupErrorState());
      } catch (e) {
        print(e);
      }
    } else {
      print("no ideas selected");
      const SnackBar(content: Text('no ideas selected'));
      emit(AppSignupErrorState());
    }
  }

  // get user data from cloud firestore
  UserModel userModel = UserModel();
  Future<void> getUserData() async {
    emit(AppGetUserDataLoadingState());
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('users');
      DocumentReference documentRef = collectionRef.doc(uId);
      await documentRef.get().then((value) {
        print(value.data());
        userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
        // CacheHelper.saveData(key: 'uId', value: userModel!.uId);
        print(userModel!.name);
        print(userModel!.email);
        print(userModel!.ideas);
        print(userModel!.uId);
        print(uId);
      });
      emit(AppGetUserDataSuccessState());
    } catch (e) {
      print(e);
      emit(AppGetUserDataErrorState());
    }
  }

  // logout
  Future<void> logout() async {
    emit(AppLogoutLoadingState());
    await FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'uId');
      userModel = UserModel(name: '', email: '', ideas: []);
      emit(AppLogoutSuccessState());
    });
  }

  bool isDark = false;
  void changeThemeMode() {
    isDark = !isDark;
    emit(AppChangeThemeModeState());
  }
}
