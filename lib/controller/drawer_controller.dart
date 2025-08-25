import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class DrawerControllerX extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  void hideDrawer() {
    advancedDrawerController.hideDrawer();
  }
}
