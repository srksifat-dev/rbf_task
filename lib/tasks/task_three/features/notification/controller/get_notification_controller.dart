import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/tasks/task_three/features/notification/models/notification_list_model.dart';
import 'package:rbf_task/tasks/task_three/features/notification/providers/notification_list_provider.dart';

class NotificationController extends GetxController {

  // Scroll Controller
  ScrollController notificationScrollController = ScrollController();

  // Providers
  NotificationListProvider notificationListProvider =
      NotificationListProvider();

  final notificationListModel = NotificationListModel().obs;
  final notificationLength = 0.obs;
  final currentPageNumber = 1.obs;
  final totalUnreadNotification = 0.obs;

  final isSelectionMode = false.obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    notificationScrollController
        .addListener(() => notificationScrollListener());
    getNotifications(pageNumber: currentPageNumber.value);
    super.onReady();
  }

  getNotifications({required int pageNumber}) async {
    isLoading.value = true;
    try {
      var data = await notificationListProvider.getNotifications();
      if (data != null) {
        notificationListModel.value = data;
        notificationLength.value =
            notificationListModel.value.data!.results == null
                ? 0
                : notificationListModel.value.data!.results == []
                    ? 0
                    : notificationListModel.value.data!.results!.length;
        totalUnreadNotification.value = data.data!.totalunread!;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void getMoreNotifications({required int pageNumber}) async {
    isLoading.value = true;
    try {
      var data = await notificationListProvider.getNotifications(
          pageNumber: pageNumber);
      if (data!.data!.results != null) {
        notificationListModel.value.data!.results?.addAll(data.data!.results!);
      }
      notificationLength.value =
          notificationListModel.value.data!.results!.length;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void notificationScrollListener() {
    if (notificationScrollController.position.pixels ==
        notificationScrollController.position.maxScrollExtent) {
      try {
        getMoreNotifications(pageNumber: currentPageNumber.value++);
      } catch (e) {
        throw Exception("Something went wrong: $e");
      }
    }
  }
}
