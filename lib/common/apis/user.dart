import 'package:base_framework/common/index.dart';
import 'package:dio/dio.dart';

class UserApi {
  /// 登录
  static Future<UserProfileModel> login(UserLoginRequest? params) async {
    print('login request: ${params!.toJson()}');
    var response = await HttpRequestService.to.post(
      '/jw-cloud-auth/v1/open/user/login',
      data: FormData.fromMap(params.toJson()),
    );
    print("respnse:$response");

    return UserProfileModel.fromJson(response.data);
  }
}
