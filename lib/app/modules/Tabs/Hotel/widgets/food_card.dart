import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  FoodCard({super.key, required this.itemData});
  Map itemData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.foodDetailsPage,arguments: {'item':itemData});
      },
      child: Container(
        // width: 335,
        height: 132,
        margin: EdgeInsets.symmetric(vertical: AppHeight.h6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r14),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(0, 4),
                blurRadius: 24)
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(AppWidth.w12),
              width: AppWidth.w96,
              height: AppHeight.h108,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r12),
              ),
              child: CachedNetworkImageShare(
                urlImage: itemData['image_url'],
                widthNumber: AppWidth.w96,
                heigthNumber: AppHeight.h108,
                borderNumber: 12,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  itemData['name'],
                  color: AppColors.indicatorColor,
                  fontSize: 14,
                  fontWeight: AppFontWeight.medium,
                ),
                SizedBox(
                  height: AppHeight.h4,
                ),
                CustomText(
                Common.limitString(itemData['description_text'].toString(), 20),
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: AppFontWeight.regularOrNormal,
                ),
                SizedBox(
                  height: AppHeight.h4,
                ),
                Row(
                  children: [
                    CustomText(
                      '${itemData['price']} \$',
                      color: AppColors.btnColor,
                      fontWeight: AppFontWeight.bold,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: AppHeight.h132,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppWidth.w28,
                    height: AppHeight.h28,
                    margin: EdgeInsets.only(
                        top: AppHeight.h15, right: AppWidth.w12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                            offset: Offset(0, 4),
                            blurRadius: 24)
                      ],
                      color: AppColors.white,
                    ),
                    // child: Center(
                    //   child: SvgPicture.asset(
                    //       width: AppWidth.w14,
                    //       height: AppHeight.h14,
                    //       ImageAssetsSvgs.favSvg),
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: AppHeight.h20, right: AppWidth.w12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(ImageAssetsSvgs.starSvg),
                        SizedBox(width: AppWidth.w2),
                        CustomText(
                          itemData['av_rating'].toString(),
                          textAlign: TextAlign.right,
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: AppFontWeight.medium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
