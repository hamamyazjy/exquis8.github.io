// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, must_be_immutable
import 'dart:math' as math; // import this

import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Controllers/hotel_controller.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  int? index;
  String? image;
  String? title;
  HomeCard({
    Key? key,
    this.index,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.find();

    return GestureDetector(
      onTap: () {
        if (title!.contains('menu')) {
          hotelController.getItemMenu();
          Get.toNamed(AppRoutes.roomServiceMenuePage,arguments: {
            'title':title,
            'image':image,
          });
        }
      },
      child: Container(
        height: AppHeight.h173,
        width: Get.width,
        margin: EdgeInsets.symmetric(
            horizontal: AppWidth.w24, vertical: AppHeight.h8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SizedBox(
              height: AppHeight.h173,
              width: Get.width,
              child: CachedNetworkImageShare(
                urlImage: image!,
                widthNumber: Get.width,
                heigthNumber: AppHeight.h173,
                borderNumber: 16,
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r16),
                  gradient: const LinearGradient(
                      begin:
                          Alignment(1.4944562911987305, -0.38913607597351074),
                      end: Alignment(0.3692593276500702, 0.42528235912323),
                      colors: [
                        Color.fromRGBO(35, 34, 71, 1),
                        Color.fromRGBO(35, 34, 71, 0)
                      ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w20, vertical: AppHeight.h20),
              child: index == 1
                  ? Column(
                      children: [
                        SizedBox(
                          width: AppWidth.w240,
                          child: CustomText(
                            title,
                            textAlign: TextAlign.left,
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: AppHeight.h10,
                        ),
                        CustomButton(
                          title: 'Explore',
                          height: AppHeight.h36,
                          onTap: () {
                            hotelController.getHotelDetails();
                            Get.toNamed(AppRoutes.hotelDetailsPage);
                          },
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: AppWidth.w240,
                          child: CustomText(
                            title,
                            textAlign: TextAlign.left,
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                        SizedBox(width: AppHeight.h8),
                        Container(
                          width: AppWidth.w32,
                          height: AppHeight.h32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.r40),
                            color: AppColors.btnColor,
                          ),
                          child: SizedBox(
                            width: AppWidth.w26,
                            height: AppHeight.h26,
                            child: SvgPicture.asset(
                              ImageAssetsSvgs.arrowUpRightSvg,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
