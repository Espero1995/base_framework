import 'package:base_framework/common/index.dart';

class UserApi {
  /// 登录
  static Future<UserProfileModel> login(UserLoginRequest? params) async {
    print('login request: ${params!.toJson()}');
    var response = await HttpRequestService.to.post(
      '/jw-cloud-auth/v1/open/user/login',
      data: params,
      contentType: "form",
    );
    print("respnse:$response");

    return UserProfileModel.fromJson(response.data);
  }
}
