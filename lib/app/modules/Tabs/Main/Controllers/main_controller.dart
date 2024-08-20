import 'package:get/get.dart';

class MainController extends GetxController {
  int indexScreen = 0;

  setIndexScreen(int value) {
    indexScreen = value;

    update(['indexScreen']);
  }
}
