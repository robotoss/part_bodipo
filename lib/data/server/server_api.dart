import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bodipo/data/models/temp/eat_model.dart';
import 'package:flutter_bodipo/data/models/temp/news_model.dart';

class ServerApi {
  static ServerApi _instance = new ServerApi.internal();
  factory ServerApi() => _instance;

  ServerApi.internal() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    setToken();
  }

  static String baseUrl = "https://api.npoint.io/";

  // String token = "";

  var dio = Dio();

  void setToken() {
    // this.token = token;
    Interceptors interceptors = dio.interceptors;

    interceptors.requestLock.lock();

    interceptors.clear();
    interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
      // options.headers["Authorization"] = "Bearer $token";

      return options;
    }));

    interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    interceptors.requestLock.unlock();
  }

  ///
  /// НОВОСТИ
  ///

  // Получение новостей
  Future<List<NewsModel>> getNewsList() async {
    Response<String> authResponse =
        await dio.get("${baseUrl}6c9e43816bd3bdc884e4");
    return newsModelFromJson(authResponse.toString());
  }

  ///
  /// ПИТАНИЕ
  ///


  // Получение питания
  Future<List<EatModel>> getEatList() async {
    Response<String> authResponse =
        await dio.get("${baseUrl}588a1598b3e2426743c2");
    return eatModelFromJson(authResponse.toString());
  }
}
