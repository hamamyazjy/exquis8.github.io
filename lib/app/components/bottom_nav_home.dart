// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, must_be_immutable

import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Main/Controllers/main_controller.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavHome extends StatelessWidget {
  List<String> iconsImages = [
    ImageAssetsSvgs.hotelSvg,
    ImageAssetsSvgs.servicesSvg,
    ImageAssetsSvgs.inboxSvg,
    ImageAssetsSvgs.profileSvg,
  ];
  List<String> iconsActiveImages = [
    ImageAssetsSvgs.hotelSolidSvg,
    ImageAssetsSvgs.servicesSolidSvg,
    ImageAssetsSvgs.inboxSolidSvg,
    ImageAssetsSvgs.profileSolidSvg,
  ];

  List<String> iconNames = ['Hotel', 'Services', 'Inbox', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: 'indexScreen',
      builder: (controller) {
        return Container(
          width: Get.width,
          height: AppHeight.h70,
          margin: EdgeInsets.symmetric(
              horizontal: AppWidth.w15, vertical: AppHeight.h25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r85),
            color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
            // gradient: LinearGradient(
            //     begin: Alignment(0.6349141001701355, 0.26728686690330505),
            //     end: Alignment(-0.26728686690330505, 0.2510286569595337),
            //     colors: [
            //       Color.fromRGBO(255, 255, 255, 0.4699999988079071),
            //       Color.fromRGBO(255, 255, 255, 0)
            //     ]),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r85),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: Get.width,
                    height: AppHeight.h70,
                    child: SvgPicture.asset(
                      ImageAssetsSvgs.bottomNavSvg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(iconsImages.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.setIndexScreen(index);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppHeight.h10,
                          ),
                          SvgPicture.asset(
                            controller.indexScreen == index
                                ? iconsActiveImages[index]
                                : iconsImages[index],
                            height: AppHeight.h24,
                            width: AppWidth.w24,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: AppHeight.h4,
                          ),
                          CustomText(
                            iconNames[index],
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: AppFontWeight.bold,
                          ),
                          SizedBox(
                            height: AppHeight.h10,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
