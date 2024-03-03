import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/tasks/task_one/screens/task_one_screen.dart';
import 'package:rbf_task/tasks/task_three/features/auth/controller/login_controller.dart';
import 'package:rbf_task/core/http_override.dart';
import 'package:rbf_task/tasks/task_three/features/notification/screens/notification_screen.dart';
import 'package:rbf_task/tasks/task_two/screens/task_two_screen.dart';

import 'theme/app_colors.dart';

Future<void> main() async {
  // To avoid Handshake Exception
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // to Use Dynamic Color based on user device wallpaper
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightDynamic ?? lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkDynamic ?? darkColorScheme,
        ),
        home: MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("RBF Tech Zone Tasks"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TaskOneScreen()));
                  },
                  child: const Text("Task One")),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TaskTwoScreen()));
                  },
                  child: const Text("Task Two")),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
                  },
                  child: const Text("Task Three")),
            ],
          ),
        ));
  }
}
