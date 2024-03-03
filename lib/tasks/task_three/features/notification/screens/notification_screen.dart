import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/core/utils/loader.dart';
import 'package:rbf_task/tasks/task_three/features/notification/controller/get_notification_controller.dart';
import 'package:rbf_task/tasks/task_three/features/notification/screens/all_notifications_screen.dart';

import '../controller/update_notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationController notificationController =
      Get.put(NotificationController());
  final UpdateNotificationController updateNotificationController =
      Get.put(UpdateNotificationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: const Text("Task Three"),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Badge(
                    label: AnimatedFlipCounter(
                      value:
                          notificationController.totalUnreadNotification.value,
                    ),
                    offset: const Offset(0, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllNotificationsScreen()));
                      },
                      icon: const Icon(
                        Icons.notifications,
                      ),
                    ),
                  ))
            ],
          ),
          body: notificationController.isLoading.value
              ? const Loader()
              : Container()),
    );
  }
}
