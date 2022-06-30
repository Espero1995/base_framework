class UserProfileModel {
  String? accessToken;
  String? account;
  String? custom;
  String? nickName;
  String? realName;
  int? tokenEffectTime;
  String? userId;
  int? userType;

  UserProfileModel(
      {this.accessToken,
      this.account,
      this.custom,
      this.nickName,
      this.realName,
      this.tokenEffectTime,
      this.userId,
      this.userType});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    account = json['account'];
    custom = json['custom'];
    nickName = json['nickName'];
    realName = json['realName'];
    tokenEffectTime = json['tokenEffectTime'];
    userId = json['userId'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['account'] = account;
    data['custom'] = custom;
    data['nickName'] = nickName;
    data['realName'] = realName;
    data['tokenEffectTime'] = tokenEffectTime;
    data['userId'] = userId;
    data['userType'] = userType;
    return data;
  }
}
