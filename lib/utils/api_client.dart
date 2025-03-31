import 'dart:convert';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/main.dart';
import 'package:app/services/user.service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final globalApiClient = ApiClient().init();

class ApiClient {
  Dio _dio = Dio();
  String? selfHostedRestApiUrl;
  String? refreshToken;
  String? idToken;

  ApiClient();
  ApiClient.test(this._dio);

  init() {
    readFromCache();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: env!.debugApiClient,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (selfHostedRestApiUrl != null && selfHostedRestApiUrl != '') {
            options.baseUrl = selfHostedRestApiUrl!;
          } else {
            options.baseUrl = env!.restApiUrl;
          }
          options.headers['content-Type'] = 'application/json';
          if (idToken != null) {
            options.headers['Authorization'] = 'Bearer $idToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          try {
            if (error.response?.statusCode == 401 &&
                !['/auth/login', '/auth/refresh']
                    .contains(error.requestOptions.path)) {
              // Get stored user data
              final userDataRaw = prefs?.getString('user');
              final refreshToken = prefs?.getString('refreshToken');
              if (userDataRaw == null) {
                return handler.reject(error);
              }

              final userData = json.decode(userDataRaw);
              final user = UserEntity.fromJson(userData);
              user.refreshToken = refreshToken;

              try {
                final newToken = await UserService.refreshToken(user);
                if (newToken == null) {
                  return handler.reject(error);
                }

                // Update stored token
                idToken = newToken;
                setIdToken(newToken);

                // Update stored user data with new token
                await prefs?.setString('user', json.encode(userData));
                await prefs?.setString('accessToken', newToken);

                // Retry original request with new token
                final opts = Options(
                  extra: error.requestOptions.extra,
                  method: error.requestOptions.method,
                  responseType: error.requestOptions.responseType,
                  sendTimeout: error.requestOptions.sendTimeout,
                  headers: error.requestOptions.headers,
                );
                opts.headers!['Authorization'] = 'Bearer $newToken';

                final response = await _dio.request(
                  error.requestOptions.path,
                  options: opts,
                  cancelToken: error.requestOptions.cancelToken,
                  data: error.requestOptions.data,
                  onReceiveProgress: error.requestOptions.onReceiveProgress,
                  onSendProgress: error.requestOptions.onSendProgress,
                  queryParameters: error.requestOptions.queryParameters,
                );

                return handler.resolve(response);
              } catch (refreshError) {
                return handler.reject(error);
              }
            }
            return handler.next(error);
          } catch (e) {
            return handler.reject(error);
          }
        },
      ),
    );
    return this;
  }

  readFromCache() async {
    selfHostedRestApiUrl = prefs?.getString('self_hosted_rest_api_url');
    idToken = prefs?.getString('accessToken');
    refreshToken = prefs?.getString('refreshToken');
  }

  setIdToken(String? idToken) {
    _dio.options.headers['Authorization'] = idToken == null ? null : 'Bearer $idToken';
  }

  static Future<bool> setSelfHostedRestApiUrl(String url) async {
    bool? result = await prefs?.setString('self_hosted_rest_api_url', url);
    return result ?? false;
  }

  static String? getSelfHostedRestApiUrl() {
    String? selfHostedRestApiUrl = prefs?.getString('self_hosted_rest_api_url');
    if (selfHostedRestApiUrl == null || selfHostedRestApiUrl.isEmpty) {
      return null;
    } else {
      return selfHostedRestApiUrl;
    }
  }

  get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    readFromCache();
    return await _dio.get(path,
        options: options, queryParameters: queryParameters);
  }

  post(String path, {data}) async {
    await readFromCache();
    return await _dio.post(path, data: data);
  }

  put(String path, {data}) async {
    await readFromCache();
    return await _dio.put(path, data: data);
  }

  delete(String path) async {
    await readFromCache();
    return await _dio.delete(path);
  }
}
