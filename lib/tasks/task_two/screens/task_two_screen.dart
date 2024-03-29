import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rbf_task/core/utils/device_size.dart';

import '../models/page_model.dart';

class TaskTwoScreen extends StatefulWidget {
  const TaskTwoScreen({super.key});

  @override
  State<TaskTwoScreen> createState() => _TaskTwoScreenState();
}

class _TaskTwoScreenState extends State<TaskTwoScreen> {
  int pageIndex = 0;
  double animatedContainerHeight = 100;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Two"),
      ),
      body: Row(
        children: [
          // Custom Navigation rail
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 8,
                    width: context.hp(10),
                    color: Colors.orange[900],
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: animatedContainerHeight,
                    width: context.hp(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 100,
                    width: context.hp(10),
                    decoration: BoxDecoration(
                      color: Colors.orange[900],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: context.hp(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 8,
                    width: context.hp(10),
                    color: Colors.orange[900],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 8,
                  ),
                  SizedBox(
                    height: 100,
                    width: context.hp(10),
                    child: Icon(
                      Icons.abc,
                      size: 80,
                      color: Colors.orange[900],
                    ),
                  ),
                  SizedBox(
                    width: context.hp(10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                pageIndex = index;
                                animatedContainerHeight = 100 + (index * 100);
                              });
                            },
                            child: SizedBox(
                              height: 100 + index.toDouble(),
                              width: context.hp(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    pages[index].icon,
                                    color: pageIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    pages[index].iconLabel,
                                    style: TextStyle(
                                      color: pageIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = pages.length + 1;
                        animatedContainerHeight = context.hp(80) - 56;
                      });
                    },
                    child: SizedBox(
                      height: 100,
                      width: context.hp(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: pageIndex == pages.length + 1
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                              color: pageIndex == pages.length + 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                  ),
                ],
              )
            ],
          ),

          // Body
          Expanded(child: Center(
            child: pageIndex == pages.length + 1 ? Text("Account") : Text(pages[pageIndex].bodyContent),
          ))
        ],
      ),
    );
  }
}
