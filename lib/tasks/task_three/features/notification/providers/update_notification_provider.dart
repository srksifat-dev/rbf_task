import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdateNotificationProvider {

  Future<void> markAsRead(
      {required List<int> notificationIds, required String token}) async {
    const String apiUrl =
        'https://sherpur.rbfgroupbd.com/update_notification_status';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'notification_Ids': notificationIds,
          'status': "Read",
        }),
      );

      if (response.statusCode == 200) {
        throw Exception('Notification status updated successfully');
      } else {
        throw Exception('Failed to update notification status: ${response.statusCode}');
       
      }
    } catch (e) {
      throw Exception('Error updating notification status: $e');
    }
  }

  Future<void> deleteNotifications(
      {required List<int> notificationIds, required String token}) async {
    const String apiUrl =
        'https://sherpur.rbfgroupbd.com/update_notification_status';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'notification_Ids': notificationIds,
          'status': "Delete",
        }),
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to update notification status: ${response.statusCode}');
        
      }
    } catch (e) {
      throw Exception('Error updating notification status: $e');
    }
  }
}
