// directory : tubes2_uas_kelompok7/lib/core/utils/route_utils.dart

import 'package:get/get.dart';

class RouteApp {
  static String initial = '/';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainMenuScreen()),
  ];
}