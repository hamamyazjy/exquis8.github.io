import 'package:exquis8_hotel_app/app/modules/Tabs/Main/Controllers/main_controller.dart';
import 'package:get/get.dart';
 
class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(),);
  }
}
