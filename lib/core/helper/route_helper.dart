import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presntation/page/main_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String intro = '/intro';

  static String getInitialRoute() {
    return '$initial';
  }

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(HomePage())),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}
