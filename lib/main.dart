import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runZonedGuarded(() { runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  ); }, (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });

}
