import 'dart:io';

import 'package:base_framework/global.dart';
import 'package:dio/adapter.dart';
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
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    // 拦截器
    _dio.interceptors.add(RequestInterceptors());

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease && PROXY_ENABLE) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $PROXY_IP:$PROXY_PORT";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
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
    String contentType = "json",
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    // json 格式 / form 表单格式
    Response response = await _dio.post(
      url,
      data: contentType == "json" ? data : FormData.fromMap(data.toJson()),
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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);
    if (UserService.to.hasToken) {
      options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    }
    return handler.next(options);
  }

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
      int ret = response.data["ret"];
      String info = response.data["info"];
      if (ret == 0) {
        handler.next(response);
      } else {
        Loading.error(text: "$info【$ret】");
      }
    }
  }

  /// 退出并重新登录
  Future<void> _errorNoAuthLogout() async {
    await UserService.to.logout();
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
          final statusCode = response?.statusCode;
          var msg = '';
          switch (response!.statusCode) {
            case 401: // 401 标识没有登录认证
              msg = LocaleKeys.netUnauthorized.tr;
              _errorNoAuthLogout();
              break;
            case 404:
              msg = LocaleKeys.netNotFound.tr;
              break;
            case 500:
              msg = LocaleKeys.netServerError.tr;
              break;
            case 502:
              msg = LocaleKeys.netBadGateway.tr;
              break;
            default:
              msg = LocaleKeys.netUnknownMistake.tr;
              break;
          }
          Loading.error(text: "$statusCode - $msg");
        }
        break;
      case DioErrorType.connectTimeout:
        print('network request timed out');
        Loading.error(text: LocaleKeys.netTimeout.tr);
        break;
      case DioErrorType.sendTimeout:
        print('network send timed out');
        Loading.error(text: LocaleKeys.netTimeout.tr);
        break;
      case DioErrorType.receiveTimeout:
        print('network receive timed out');
        Loading.error(text: LocaleKeys.netTimeout.tr);
        break;
      case DioErrorType.cancel:
        print('request cancel');
        Loading.error(text: LocaleKeys.netCancel.tr);
        break;
      case DioErrorType.other:
        print("other error type: ${err.message}");
        Loading.error(text: LocaleKeys.netOther.tr);
        break;
      default:
        print('unknown mistake');
        Loading.error(text: LocaleKeys.netUnknownMistake.tr);
        break;
    }
    err.error = exception;
    handler.next(err);
  }
}
