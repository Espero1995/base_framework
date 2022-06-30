import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../index.dart';

class HttpRequestService extends GetxService {
  static HttpRequestService get to => Get.find();

  late final Dio _dio;

  final CancelToken _cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();

    // 初始 dio
    var options = BaseOptions(
      baseUrl: Constants.jwApiBaseUrl,
      connectTimeout: 10000, //10秒
      receiveTimeout: 5000, //5秒
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  /// get 请求
  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  /// post 请求
  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  /// put 请求
  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response;
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.response,
        ),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  /// 退出并重新登录
  Future<void> _errorNoAuthLogout() async {
    // 退出登录 TODO
    // await UserService.to.logout();
    Get.toNamed(RouteNames.systemLoginRoute);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final exception = HttpException(err.message);
    switch (err.type) {
      // 服务端自定义错误体处理
      case DioErrorType.response:
        {
          // doing..
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          switch (errorMessage.statusCode) {
            case 401: // 401 标识没有登录认证
              _errorNoAuthLogout();
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            default:
              break;
          }
          Loading.error(text: errorMessage.message);
        }
        break;
      case DioErrorType.other:
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        break;
      default:
        break;
    }
    err.error = exception;
    handler.next(err);
  }
}
