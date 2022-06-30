class UserLoginRequest {
  String? account;
  String? passwd;

  UserLoginRequest({
    this.account,
    this.passwd,
  });

  UserLoginRequest.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    passwd = json['passwd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account'] = account;
    data['passwd'] = passwd;
    return data;
  }
}
