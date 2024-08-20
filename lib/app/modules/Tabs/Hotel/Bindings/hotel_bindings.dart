import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Controllers/hotel_controller.dart';
import 'package:get/get.dart';
 
class HotelBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HotelController>(HotelController(),);
  }
}
