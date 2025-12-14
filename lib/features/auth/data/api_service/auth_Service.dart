import 'dart:developer';

import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  Future<void> login({required email, required password}) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {'email': email, 'password': password},
      );
      log('Login Response: ${response.data}');
    } on DioException catch (e) {
      log(e.response?.data ?? e.message);
    } catch (e) {
      log("error:$e");
    }
  }
}
