import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:era/constants.dart';

class RegisterWebServices {
  late Dio dio;
  RegisterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(milliseconds: 20000),
      connectTimeout: const Duration(milliseconds: 20000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<String> registerMethod({
    required String userName,
    required String email,
    required String firtname,
    required String lastname,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        '/register/',
        data: json.encode({
          "username": userName,
          "email": email,
          "first_name": firtname,
          "last_name": lastname,
          "phone": phone,
          "password": password,
        }),
      );
      print(response.data);
      return response.data['username'];
    } catch (e) {
      print('error : ${e.toString()}');
      return e.toString();
    }
  }
}
