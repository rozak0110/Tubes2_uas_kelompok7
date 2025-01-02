// point 36
// directory : tubes2_uas_kelompok7/lib/core/config/main_app.dart

import '../utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteApp.routes,
      initialRoute: RouteApp.initial,
    );
  }
}