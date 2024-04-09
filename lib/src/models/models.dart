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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'record': record,
    };
  }
}

class AdvertisementModel {
  dynamic thumbnail;
  dynamic video;

  AdvertisementModel({this.thumbnail, this.video});

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementModel(
      thumbnail: json['thumbnail'],
      video: json['video'],
    );
  }
}

class UserModel {
  String? name;
  String? email;
  String? password;
  List<IdeaModel>? ideas;
  String? uId;
  String? image;
  bool? isPremium;

  UserModel(
      {this.name,
       this.email,
       this.password,
       this.ideas,
       this.uId,
        this.isPremium,
      this.image = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      ideas: (json['ideas'] as List).map((e) => IdeaModel.fromJson(e)).toList(),
      uId: json['uId'],
      image: json['image'],
      isPremium: json['isPremium'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'ideas': ideas!.map((e) => e.toJson()).toList(),
      'uId': uId,
      'image': image,
      'isPremium': isPremium,
    };
  }
}
