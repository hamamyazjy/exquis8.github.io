// ignore_for_file: must_be_immutable

import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RoomTypeCard extends StatelessWidget {
  String? image;
  RoomTypeCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppHeight.h15),
      child: Column(
        children: [
          CachedNetworkImageShare(
            urlImage: image,
            widthNumber: Get.width,
            heigthNumber: AppHeight.h187,
            borderNumber: 0.1,
          ),
          SizedBox(
            height: AppHeight.h20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Advantage garden vie',
                      color: AppColors.indicatorColor,
                      fontSize: 16,
                      fontWeight: AppFontWeight.bold,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssetsSvgs.wifiSvg,
                          width: AppWidth.w20,
                          height: AppHeight.h20,
                        ),
                        SizedBox(
                          width: AppWidth.w8,
                        ),
                        SvgPicture.asset(
                          ImageAssetsSvgs.breakfastSvg,
                          width: AppWidth.w20,
                          height: AppHeight.h20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppHeight.h16,
                ),
                CustomText(
                  '600 \$',
                  textAlign: TextAlign.left,
                  color: AppColors.btnColor,
                  fontSize: 16,
                  fontWeight: AppFontWeight.bold,
                ),
                CustomText(
                  '1 Single bed, 1 guest',
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: AppFontWeight.regularOrNormal,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
