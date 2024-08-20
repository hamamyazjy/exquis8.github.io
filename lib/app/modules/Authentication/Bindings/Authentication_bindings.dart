import 'package:exquis8_hotel_app/app/modules/Authentication/Controllers/Authentication_controller.dart';
import 'package:get/get.dart';
   
class AuthenticationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
  }
}
