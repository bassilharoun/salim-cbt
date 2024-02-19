class FearModel {
  String id;
  String title;
  Map<String, dynamic> ideas;

  FearModel({required this.id, required this.title, required this.ideas});

  factory FearModel.fromJson(Map<String, dynamic> json) {
    return FearModel(
      id: json['id'],
      title: json['title'],
      ideas: json['ideas'],
    );
  }
}

class ContactModel {
  String name, phoneNumber;
  bool isSelected;

  ContactModel(this.name, this.phoneNumber, this.isSelected);
}

class IdeaModel {
  String title;
  String record;
  bool isSelected;

  IdeaModel(
      {required this.title, required this.record, this.isSelected = false});

  factory IdeaModel.fromJson(Map<String, dynamic> json) {
    return IdeaModel(
      title: json['title'],
      record: json['record'],
    );
  }
}
