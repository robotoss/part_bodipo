import 'package:flutter_bodipo/data/models/temp/eat_model.dart';
import 'package:flutter_bodipo/data/models/temp/login_model.dart';
import 'package:flutter_bodipo/data/models/temp/news_model.dart';
import 'package:flutter_bodipo/data/server/server_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;
  Repository._internal() {}

  ServerApi api = ServerApi();

  ///
  /// НОВОСТИ
  ///

  /// Получение новостей
  Future<List<NewsModel>> getNewsList() async {
    return api.getNewsList();
  }

  ///
  /// ПИТАНИЕ
  ///

  /// Получение питания
  Future<List<EatModel>> getEatList() async {
    return api.getEatList();
  }

  ///
  /// АВТОРИЗАЦИЯ
  ///

  /// Мнимая авторизация
  Future<LoginModel> getAuth(String login, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (login == 'test' && password == '1q2w3e4r') {
      return LoginModel(
          login: 'test login',
          password: '1q2w3e4r',
          token: 'dsf24dsg3255dgc234325dgxb423452');
    } else {
      return null;
    }
  }

  ///
  /// ПОЛЬЗОВАТЕЛЬ
  ///

  /// Сохранить Токен
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  /// Инициализировать токен
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  /// Удалить токен
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
