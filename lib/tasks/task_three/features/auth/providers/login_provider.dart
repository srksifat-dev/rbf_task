import 'dart:convert';

import 'package:rbf_task/tasks/task_three/features/auth/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  Future<String?> login({
    required String username,
    required String password,
  }) async {
    var url = Uri.https("sherpur.rbfgroupbd.com", "/login");
    try {
      final response = await http
          .post(url, body: {"username": username, "password": password});

      if (response.statusCode == 200) {
        // Casting response data as LoginModel object
        final data = LoginModel.fromMap(jsonDecode(response.body));
        return data.data!.token;
      } else {
        throw Exception("Failed to login");
      }
    } catch (e) {
      throw Exception("Something went error: $e");
    }
  }
}
