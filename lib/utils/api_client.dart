import 'dart:convert';

import 'package:app/main.dart';
import 'package:app/services/firebase.service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  Dio _dio = Dio();
  String? refreshToken;
  String? idToken;

  ApiClient();
  ApiClient.test(this._dio);

  init() {
    readTokenFromCache();
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
          options.baseUrl = env!.restApiUrl;
          options.headers['content-Type'] = 'application/json';
          if (idToken != null) {
            options.headers['Authorization'] = 'Bearer $idToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          try {
            if (error.response?.statusCode == 401) {
              final newToken = await FirebaseService.refreshToken();
              final userDataRaw = prefs?.getString('user');
              final userData = json.decode(userDataRaw!);
              userData!['idToken'] = newToken;
              await prefs?.setString('user', json.encode(userData));
              idToken = newToken;
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
              if (response.statusCode != 401) {
                return handler.resolve(response);
              } else {
                return handler.reject(error);
              }
            }
            return handler.next(error);
          } catch (e) {
            // TODO
          }
        },
      ),
    );
    return this;
  }

  readTokenFromCache() async {
    final userDataRaw = prefs?.getString('user');
    if (userDataRaw != null) {
      final userData = json.decode(userDataRaw);
      idToken = userData?['idToken'];
      refreshToken = userData?['refreshToken'];
    }
  }

  setIdToken(String idToken) {
    _dio.options.headers['Authorization'] = 'Bearer $idToken';
  }

  get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    await readTokenFromCache();
    return await _dio.get(path,
        options: options, queryParameters: queryParameters);
  }

  post(String path, {data}) async {
    await readTokenFromCache();
    return await _dio.post(path, data: data);
  }

  put(String path, {data}) async {
    await readTokenFromCache();
    return await _dio.put(path, data: data);
  }

  delete(String path) async {
    await readTokenFromCache();
    return await _dio.delete(path);
  }
}
