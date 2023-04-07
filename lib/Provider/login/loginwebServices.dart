import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:era/constants.dart';

class LoginWebServices {
  late Dio dio;
  LoginWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(milliseconds: 20000),
      connectTimeout: const Duration(milliseconds: 20000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<String> LoginMethod(
      {required String userName, required String password}) async {
    try {
      Response response = await dio.post(
        '/login/',
        data: json.encode({"username": userName, "password": password}),
      );
      print(response.data);
      return response.data['access'];
    } catch (e) {
      print('error : ${e.toString()}');
      return 'user not found';
    }
  }
}
