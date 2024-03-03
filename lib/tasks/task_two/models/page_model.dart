import 'package:flutter/material.dart';

class PageModel {
  final String bodyContent;
  final IconData icon;
  final String iconLabel;
  PageModel({
    required this.bodyContent,
    required this.icon,
    required this.iconLabel,
  });
}

List<PageModel> pages = [
    PageModel(bodyContent: "Home", icon: Icons.home, iconLabel: "Home"),
    PageModel(
        bodyContent: "Table",
        icon: Icons.grid_view_rounded,
        iconLabel: "Table"),
    PageModel(
        bodyContent: "Order", icon: Icons.shopping_cart, iconLabel: "Order"),
    PageModel(
        bodyContent: "History", icon: Icons.history, iconLabel: "History"),
    PageModel(
        bodyContent: "Notification",
        icon: Icons.notifications,
        iconLabel: "Notification"),
  ];
