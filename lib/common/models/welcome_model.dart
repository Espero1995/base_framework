class WelcomeModel {
  String? image;
  String? title;
  String? desc;

  WelcomeModel({this.image, this.title, this.desc});

  WelcomeModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}
