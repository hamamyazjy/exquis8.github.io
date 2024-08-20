import 'dart:developer';

import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Apis/hotel_api.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:get/get.dart';

class HotelController extends GetxController {
  final HotelApis hotelApis = HotelApis();
  RxMap mainPageData = {}.obs;
  RxMap hotelDetails = {}.obs;
  RxMap itemMenuData = {}.obs;

  @override
  void onInit() async {
    getMainPage();
    super.onInit();
  }

  getMainPage() async {
    await hotelApis.getMainPage(
      onSuccess: (Map mainPageData) {
        log('mainPageData  $mainPageData');
        this.mainPageData.assignAll(mainPageData);
      },
      onError: (ApiException exception) {
        log('errror ${exception.message}');
      },
    );
  }

  getItemMenu() async {
    await hotelApis.getItemMenu(
      onSuccess: (Map itemMenuData) {
        this.itemMenuData.assignAll(itemMenuData);
      },
      onError: (ApiException exception) {
        log('errror ${exception.message}');
      },
    );
  }

  getHotelDetails() async {
    await hotelApis.getHotelDetails(
      onSuccess: (Map hotelDetails) {
        this.hotelDetails.assignAll(hotelDetails);
      },
      onError: (ApiException exception) {},
    );
  }

  List<String> images = [
    ImageAssetsPngs.slide01Png,
    ImageAssetsPngs.slide02Png,
    ImageAssetsPngs.slide03Png,
    ImageAssetsPngs.slide04Png,
  ];
 

  // List<Map<String, String>> iconsFacilities = [
  //   {'name': "Wifi", 'image': ImageAssetsSvgs.wifiSvg},
  //   {'name': "Breakfast", 'image': ImageAssetsSvgs.breakfastSvg},
  //   {'name': "AC", 'image': ImageAssetsSvgs.acSvg},
  //   {'name': "Minibar", 'image': ImageAssetsSvgs.barSvg},
  //   {'name': "Room service", 'image': ImageAssetsSvgs.roomServiceSvg},
  //   {'name': "Breakfast", 'image': ImageAssetsSvgs.breakfastSvg},
  //   {'name': "Housekeeping", 'image': ImageAssetsSvgs.housekeepingSvg},
  //   {'name': "Extingusiher", 'image': ImageAssetsSvgs.extingusiherSvg},
  //   {'name': "Pet", 'image': ImageAssetsSvgs.petSvg},
  //   {'name': "Bathtub", 'image': ImageAssetsSvgs.bathtubSvg},
  //   {'name': "CCTV", 'image': ImageAssetsSvgs.cctvSvg},
  // ];
}
