import 'package:flutter/material.dart';
import 'package:salim_cbt/src/common_widgets/category.dart';
import 'package:salim_cbt/src/screens/choose_topic_screen/topic_card_widget.dart';

// var panicDummyData = [
//   Topic(
//       1, "assets/images/types/card1.svg", "أخاف ان أصاب بجلطة قلبية", "panic"),
//   Topic(2, "assets/images/types/card2.svg",
//       "أخاف أن أتوقف عن التنفس وأصاب بالإختناق", "panic"),
//   Topic(3, "assets/images/types/card4.svg",
//       "أخاف ان أفقد السيطرة على نفسي وعلى افعالي", "panic"),
//   Topic(4, "assets/images/types/card3.svg", "أخاف أن اموت وتخرج روحي", "panic"),
//   Topic(5, "assets/images/types/card1.svg",
//       "أخاف من عدم السيطرة على نوبة الهلع", "panic"),
//   Topic(6, "assets/images/types/card2.svg", "أخاف من استمرار النوبة للأبد",
//       "panic"),
//   Topic(7, "assets/images/types/card4.svg",
//       "أخاف من أن يراني الناس عند إصابتي بنوبة الهلع", "panic"),
//   Topic(8, "assets/images/types/card3.svg", "اخاف من ان أصاب بجلطة دماغية",
//       "panic"),
//   Topic(
//       9, "assets/images/types/card1.svg", "أخاف من ضغط الدم المرتفع", "panic"),
// ];

// var fearDummyData = [
//   Topic(1, "assets/images/types/card1.svg", "الخوف من حدوث شيء سيء مجهول",
//       "fear"),
//   Topic(2, "assets/images/types/card2.svg", "الخوف من الأماكن المغلفة", "fear"),
//   Topic(3, "assets/images/types/card4.svg", "الخوف من الأماكن البعيدة", "fear"),
//   Topic(4, "assets/images/types/card3.svg", "أخاف أن اموت وتخرج روحي", "fear"),
//   Topic(5, "assets/images/types/card1.svg", "الخوف من الأماكن العالية", "fear"),
//   Topic(6, "assets/images/types/card2.svg", "أخاف من استمرار النوبة للأبد",
//       "fear"),
//   Topic(7, "assets/images/types/card4.svg", "الخوف من الطائرة", "fear"),
//   Topic(8, "assets/images/types/card3.svg", "الخوف من المواقف الاجتماعية",
//       "fear"),
//   Topic(9, "assets/images/types/card1.svg", "الخوف من الامراض الجسدية", "fear"),
//   Topic(10, "assets/images/types/card1.svg", "الخوف من الامراض النفسيه والجنون",
//       "fear"),
//   Topic(11, "assets/images/types/card2.svg", "الخوف من الامتحانات", "fear"),
//   Topic(12, "assets/images/types/card4.svg", "الخوف من الاماكن العامة والجديدة",
//       "fear"),
//   Topic(13, "assets/images/types/card3.svg", "الخوف من الحيوانات", "fear"),
//   Topic(14, "assets/images/types/card1.svg",
//       "الخوف من الفحوصات والتدخلات الطبية", "fear"),
//   Topic(
//       15, "assets/images/types/card2.svg", "الخوف من الكوارث الطبيعية", "fear"),
//   Topic(16, "assets/images/types/card4.svg", "الخوف من الموت", "fear"),
//   Topic(17, "assets/images/types/card3.svg", "الخوف من الافكار الوسواسية",
//       "fear"),
//   Topic(18, "assets/images/types/card1.svg", "الخوف من الانتحار", "fear"),
//   Topic(19, "assets/images/types/card2.svg", "الخوف من أن أؤذي أولادي", "fear"),
//   Topic(20, "assets/images/types/card4.svg", "أخاف أن أؤذي نفسي", "fear"),
//   Topic(21, "assets/images/types/card3.svg", "الخوف من الحشرات", "fear"),
// ];

// var fearData = {
//   "f1": {
//     "title": "الخوف من حدوث شيء سيء مجهول",
//     "image": "assets/images/types/card1.svg",
//     "id": "1"
//   },
//   "f2": {
//     "title": "الخوف من الأماكن المغلفة",
//     "image": "assets/images/types/card2.svg",
//     "id": "2"
//   },
//   "f3": {
//     "title": "الخوف من الأماكن البعيدة",
//     "image": "assets/images/types/card4.svg",
//     "id": "3"
//   },
//   "f4": {
//     "title": "أخاف أن اموت وتخرج روحي",
//     "image": "assets/images/types/card3.svg",
//     "id": "4"
//   },
//   "f5": {
//     "title": "الخوف من الأماكن العالية",
//     "image": "assets/images/types/card1.svg",
//     "id": "5"
//   },
//   "f6": {
//     "title": "أخاف من استمرار النوبة للأبد",
//     "image": "assets/images/types/card2.svg",
//     "id": "6"
//   },
//   "f7": {
//     "title": "الخوف من الطائرة",
//     "image": "assets/images/types/card4.svg",
//     "id": "7"
//   },
//   "f8": {
//     "title": "الخوف من المواقف الاجتماعية",
//     "image": "assets/images/types/card3.svg",
//     "id": "8"
//   },
//   "f9": {
//     "title": "الخوف من الامراض الجسدية",
//     "image": "assets/images/types/card1.svg",
//     "id": "9"
//   },
//   "f10": {
//     "title": "الخوف من الامراض النفسيه والجنون",
//     "image": "assets/images/types/card1.svg",
//     "id": "10"
//   },
//   "f11": {
//     "title": "الخوف من الامتحانات",
//     "image": "assets/images/types/card2.svg",
//     "id": "11"
//   },
//   "f12": {
//     "title": "الخوف من الاماكن العامة والجديدة",
//     "image": "assets/images/types/card4.svg",
//     "id": "12"
//   },
//   "f13": {
//     "title": "الخوف من الحيوانات",
//     "image": "assets/images/types/card3.svg",
//     "id": "13"
//   },
//   "f14": {
//     "title": "الخوف من الفحوصات والتدخلات الطبية",
//     "image": "assets/images/types/card1.svg",
//     "id": "14"
//   },
//   "f15": {
//     "title": "الخوف من الكوارث الطبيعية",
//     "image": "assets/images/types/card2.svg",
//     "id": "15"
//   },
//   "f16": {
//     "title": "الخوف من الموت",
//     "image": "assets/images/types/card4.svg",
//     "id": "16"
//   },
//   "f17": {
//     "title": "الخوف من الافكار الوسواسية",
//     "image": "assets/images/types/card3.svg",
//     "id": "17"
//   },
//   "f18": {
//     "title": "الخوف من الانتحار",
//     "image": "assets/images/types/card1.svg",
//     "id": "18"
//   },
//   "f19": {
//     "title": "الخوف من أن أؤذي أولادي",
//     "image": "assets/images/types/card2.svg",
//     "id": "19"
//   },
//   "f20": {
//     "title": "أخاف أن أؤذي نفسي",
//     "image": "assets/images/types/card4.svg",
//     "id": "20"
//   },
//   "f21": {
//     "title": "الخوف من الحشرات",
//     "image": "assets/images/types/card3.svg",
//     "id": "21"
//   },
// };

var categoryData = {
  "الكل": "assets/images/icons/all.svg",
  "نوبات الهلع": "assets/images/icons/category1.svg",
  "الفوبيا": "assets/images/icons/category2.svg",
  "الاكتئاب": "assets/images/icons/category3.svg",
};
