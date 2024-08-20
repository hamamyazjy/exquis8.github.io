import 'package:bot_toast/bot_toast.dart';
import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Apis/profile_apis.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileApis profileApis = ProfileApis();

  RxInt genderGroup = 0.obs;

  RxMap accountData = {}.obs;

  @override
  void onInit() async {
    getAccountProfile();
    super.onInit();
  }

  getAccountProfile() async {
    await profileApis.getAccountProfile(
      onSuccess: (Map accountData) {
        this.accountData.assignAll(accountData);
        genderGroup.value = this.accountData['gender'] == 'Female' ? 1 : 0;
      },
      onError: (ApiException exception) {},
    );
  }

  updateProfile(Map<String, dynamic> dataSend) async {
    BotToast.showLoading();
    await profileApis.updateProfile(
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

  addAccommodation(Map<String, dynamic> dataSend) async {
    BotToast.showLoading();
    await profileApis.addAccommodation(
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

  List<Map<String, String>> profileMenu = [
    {'image': ImageAssetsSvgs.profileSolidSvg, 'name': 'Personal information'},
    {'image': ImageAssetsSvgs.calenderSoldSvg, 'name': 'About Accommodation'},
    {'image': ImageAssetsSvgs.inboxSolidSvg, 'name': 'Inbox'},
    {'image': ImageAssetsSvgs.languageSvg, 'name': 'Language'},
    {'image': ImageAssetsSvgs.questionSvg, 'name': 'Get Help'},
    {'image': ImageAssetsSvgs.sendSvg, 'name': 'Send us feedback'},
  ];
}
