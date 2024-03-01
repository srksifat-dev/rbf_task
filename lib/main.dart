import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:rbf_task/features/task_one/screens/auth_screen.dart';
import 'package:rbf_task/features/task_two/screens/custom_navigation_rail_screen.dart';

import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightDynamic ?? lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkDynamic ?? darkColorScheme,
        ),
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                        builder: (context) => const AuthScreen()));
                  },
                  child: const Text("Task One")),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const CustomNavigationRailScreen()));
                  },
                  child: const Text("Task Two")),
              FilledButton(onPressed: () {}, child: const Text("Task Three")),
            ],
          ),
        ));
  }
}
