import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/Apis/services_apis.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  final ServicesApis servicesApis = ServicesApis();
  RxMap servicesHotelData = {}.obs;
  RxMap servicesLaundryHotelData = {}.obs;
  RxDouble totalPriceLaundry = 0.0.obs;

  List<String> idServicesLaundryList = List<String>.empty().obs;

  checkIdServicesLaundryList(String id, String price) {
    if (idServicesLaundryList.contains(id)) {
      idServicesLaundryList.remove(id);
      totalPriceLaundry.value -= double.parse(price);
    } else {
      idServicesLaundryList.add(id);
      totalPriceLaundry.value += double.parse(price);
    }
  }

  @override
  void onInit() async {
    getServicesHotel();
    super.onInit();
  }

  getServicesHotel() async {
    await servicesApis.getServicesHotel(
      onSuccess: (Map servicesHotelData) {
        log('servicesHotelData  $servicesHotelData');

        this.servicesHotelData.assignAll(servicesHotelData);
      },
      onError: (ApiException exception) {
        log('exceptionexceptionexception  ${exception.message}');
      },
    );
  }

  getServicesLaundryHotel(String services) async {
    this.servicesLaundryHotelData.assignAll({});
    await servicesApis.getServicesLaundryHotel(
      services: services,
      onSuccess: (Map servicesLaundryHotelData) {
        this.servicesLaundryHotelData.assignAll(servicesLaundryHotelData);
      },
      onError: (ApiException exception) {},
    );
  }

  addRequestOrder(Map<String, dynamic> dataSend) async {
    BotToast.showLoading();
    log('dataSend$dataSend');
    await servicesApis.addRequestOrder(
      data: dataSend,
      onSuccess: (Map response) {
        BotToast.closeAllLoading();

        if (response['success']) {
          Get.back();
          Common.showNotoficationDialog(
            'Success',
            response['message'],
            Colors.green,
          );
        } else {}
      },
      onError: (ApiException exception) {
        BotToast.closeAllLoading();
        Common.showNotoficationDialog(
          'Error',
          exception.message,
          Colors.red,
        );
      },
    );
  }

  // List<Map<String, String>> iconsSerices = [
  //   {
  //     'name': 'Laundry',
  //     'image': ImageAssetsSvgs.laundrySvg,
  //     'route': AppRoutes.laundryPage,
  //   },
  //   {
  //     'name': 'Dry Cleaning',
  //     'image': ImageAssetsSvgs.dryCleaningSvg,
  //   },
  //   {
  //     'name': 'Perssing',
  //     'image': ImageAssetsSvgs.perssingSvg,
  //   },
  //   {
  //     'name': 'Fast Check-in',
  //     'image': ImageAssetsSvgs.fastCheckInSvg,
  //     'route': AppRoutes.fastCheckInStep1,
  //   },
  //   {
  //     'name': 'Fast Check-out',
  //     'image': ImageAssetsSvgs.fastCheckOutSvg,
  //   },
  //   {
  //     'name': 'Housekeeping',
  //     'image': ImageAssetsSvgs.housekeepingSvg,
  //   },
  //   {
  //     'name': 'Room Supplies',
  //     'image': ImageAssetsSvgs.roomSuppliesSvg,
  //   },
  //   {
  //     'name': 'Restaurant reservation',
  //     'image': ImageAssetsSvgs.restaurantSvg,
  //   },
  //   {
  //     'name': 'SPA reservation',
  //     'image': ImageAssetsSvgs.spaSvg,
  //   },
  //   {
  //     'name': 'TAXI',
  //     'image': ImageAssetsSvgs.taxiSvg,
  //   },
  //   {
  //     'name': 'Try Collection',
  //     'image': ImageAssetsSvgs.tryCollectionSvg,
  //   },
  //   {
  //     'name': 'wake-up call',
  //     'image': ImageAssetsSvgs.wakeUpSvg,
  //   },
  //   {
  //     'name': 'Car/Valet \n request',
  //     'image': ImageAssetsSvgs.carSvg,
  //   },
  //   {
  //     'name': 'Porter service',
  //     'image': ImageAssetsSvgs.tryCollectionSvg,
  //   },
  //   {
  //     'name': 'Concierge',
  //     'image': ImageAssetsSvgs.conciergeSvg,
  //   },
  //   {
  //     'name': 'Special request',
  //     'image': ImageAssetsSvgs.specialRequestSvg,
  //   },
  // ];
}
