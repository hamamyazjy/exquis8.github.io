 import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Controllers/profile_controller.dart';
import 'package:get/get.dart';
 
class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(),);
  }
}
