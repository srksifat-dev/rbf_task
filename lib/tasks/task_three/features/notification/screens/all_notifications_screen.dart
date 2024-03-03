import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/core/utils/loader.dart';
import 'package:rbf_task/tasks/task_three/features/notification/controller/get_notification_controller.dart';
import 'package:rbf_task/tasks/task_three/features/notification/controller/update_notification_controller.dart';

class AllNotificationsScreen extends StatelessWidget {
  AllNotificationsScreen({super.key});

// Controllers
  final NotificationController notificationController =
      Get.put(NotificationController());

  final UpdateNotificationController updateNotificationController =
      Get.put(UpdateNotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        onPopInvoked: (_) {
          // When the page popped selection mode gonna be false
          notificationController.isSelectionMode.value = false;
          // All selected notifications should be unselected
          updateNotificationController.selectedNotificationList.value = [];
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Notifications"),
              actions: [
                // Selection Button
                TextButton(
                    onPressed: () {
                      notificationController.isSelectionMode.value =
                          !notificationController.isSelectionMode.value;
                    },
                    child: notificationController.isSelectionMode.value
                        ? const Text("Cancel")
                        : const Text("Select"))
              ],
            ),
            body: Column(
              children: [
                // All Notifications
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      controller:
                          notificationController.notificationScrollController,
                      itemBuilder: (context, index) {
                        var notification = notificationController
                            .notificationListModel.value.data!.results![index];
                        return ListTile(
                          leading: notificationController.isSelectionMode.value
                              ? Checkbox(
                                  value: updateNotificationController
                                      .selectedNotificationList
                                      .contains(notification.id),
                                  onChanged: (val) {
                                    val == true
                                        ? updateNotificationController
                                            .selectedNotificationList
                                            .add(notification.id)
                                        : updateNotificationController
                                            .selectedNotificationList
                                            .removeWhere((element) =>
                                                element == notification.id);
                                  })
                              : null,
                          title: Row(
                            children: [
                              notification.read_status == "No"
                                  ? Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container(),
                              Text(
                                notification.title!,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: notification.read_status == "No"
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(notification.description!),
                          trailing: Text(
                            notification.created_at!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount:
                          notificationController.notificationLength.value),
                ),
                notificationController.isLoading.value
                    ? const Loader()
                    : Container(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: notificationController.isSelectionMode.value ? 80 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Select All Notifications
                        Checkbox(
                            value: updateNotificationController
                                .isAllSelected.value,
                            onChanged: (val) {
                              updateNotificationController.isAllSelected.value =
                                  val!;
                              if (val) {
                                for (var i in notificationController
                                    .notificationListModel
                                    .value
                                    .data!
                                    .results!) {
                                  updateNotificationController
                                      .selectedNotificationList
                                      .add(i.id);
                                }
                              } else {
                                updateNotificationController
                                    .selectedNotificationList.value = [];
                              }
                            }),
                        const Text("All"),
                        const Spacer(),
                        FilledButton(
                          onPressed: updateNotificationController
                                  .selectedNotificationList.isNotEmpty
                              ? () async {
                                  await updateNotificationController
                                      .deleteNotifications();
                                }
                              : null,
                          child:
                              updateNotificationController.deleteLoading.value
                                  ? const Loader()
                                  : const Text("Delete"),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        FilledButton(
                          onPressed: updateNotificationController
                                  .selectedNotificationList.isNotEmpty
                              ? () async {
                                  await updateNotificationController
                                      .markAsRead();
                                }
                              : null,
                          child:
                              updateNotificationController.markAsReadLoading.value
                                  ? const Loader()
                                  : const Text("Mark as read"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
