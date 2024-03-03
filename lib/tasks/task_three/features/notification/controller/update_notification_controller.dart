import 'package:get/get.dart';
import 'package:rbf_task/core/utils/toast.dart';
import 'package:rbf_task/tasks/task_three/features/auth/controller/login_controller.dart';
import 'package:rbf_task/tasks/task_three/features/notification/controller/get_notification_controller.dart';
import 'package:rbf_task/tasks/task_three/features/notification/providers/update_notification_provider.dart';

class UpdateNotificationController extends GetxController {
  // Providers
  final UpdateNotificationProvider updateNotificationProvider =
      UpdateNotificationProvider();

  // Controllers
  final NotificationController notificationController =
      Get.put(NotificationController());
  final LoginController loginController = Get.put(LoginController());

  final selectedNotificationList = [].obs;
  RxBool markAsReadLoading = false.obs;
  RxBool isAllSelected = false.obs;
  RxBool deleteLoading = false.obs;

  Future<void> markAsRead() async {
    markAsReadLoading.value = true;
    List<int> notificationIdsList =
        selectedNotificationList.map((id) => id as int).toList();
    try {
      await updateNotificationProvider.markAsRead(
        notificationIds: notificationIdsList,
        token: loginController.token.value,
      );
      selectedNotificationList.value = [];
      toast(msg: "Selected Notification/s are marked as read");
      notificationController.currentPageNumber.value = 1;
      notificationController.getNotifications(
          pageNumber: notificationController.currentPageNumber.value);
      notificationController.isSelectionMode.value = false;
      markAsReadLoading.value = false;
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  Future<void> deleteNotifications() async {
    deleteLoading.value = true;
    List<int> notificationIdsList =
        selectedNotificationList.map((id) => id as int).toList();
    try {
      await updateNotificationProvider.deleteNotifications(
        notificationIds: notificationIdsList,
        token: loginController.token.value,
      );
      selectedNotificationList.value = [];
      toast(msg: "Selected notification/s are deleted!");
      notificationController.currentPageNumber.value = 1;
      notificationController.getNotifications(
          pageNumber: notificationController.currentPageNumber.value);
      notificationController.isSelectionMode.value = false;
      deleteLoading.value = false;
    } catch (e) {
      throw Exception("Something went wrong: $e");}
  }
}
