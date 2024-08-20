import 'package:exquis8_hotel_app/app/modules/Tabs/Services/Controllers/services_controller.dart';
import 'package:get/get.dart';
 
class ServicesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ServicesController>(ServicesController(),);
  }
}
