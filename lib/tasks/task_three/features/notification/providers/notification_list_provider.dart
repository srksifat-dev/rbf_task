import 'dart:convert';

import 'package:get/get.dart';
import 'package:rbf_task/tasks/task_three/features/auth/controller/login_controller.dart';
import 'package:rbf_task/tasks/task_three/features/notification/models/notification_list_model.dart';
import 'package:http/http.dart' as http;


class NotificationListProvider {
  Future<NotificationListModel?> getNotifications({int pageNumber = 1}) async {
    final LoginController loginController = Get.put(LoginController());

    var url = Uri.parse(
        "https://sherpur.rbfgroupbd.com/get_notification?page=$pageNumber&pageSize=10");
    try {
      var response = await http.get(url, headers: <String, String>{
        "Authorization": "Bearer ${loginController.token.value}",
      });
      if (response.statusCode == 200) {
        return NotificationListModel.fromMap(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load post");
      }
    } catch (e) {
      throw Exception("Failed to load notifications: $e");
    }
  }
}
