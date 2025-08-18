import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDark = true.obs;

  void changeTheme() {
    isDark.value = !isDark.value;
  }
}
