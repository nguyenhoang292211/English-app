import 'package:get/get.dart';

class BottomTabController extends GetxController {
  var currentTabIndex = 0;

  void updateIndex(int index) {
    currentTabIndex = index;
    update();
  }
}
