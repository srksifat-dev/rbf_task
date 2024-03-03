import 'package:get/get.dart';
import 'package:rbf_task/tasks/task_three/features/auth/providers/login_provider.dart';

class LoginController extends GetxController {
  // Providers
  final LoginProvider loginProvider = LoginProvider();

  RxBool isLoading = false.obs;
  RxString token = "".obs;

  @override
  Future<void> onReady() async {
    try {
      login();
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
    super.onReady();
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final data =
          await loginProvider.login(username: "0187832241", password: "123456"); // Login with given credentials
      token.value = data!;
      isLoading.value = false;
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
