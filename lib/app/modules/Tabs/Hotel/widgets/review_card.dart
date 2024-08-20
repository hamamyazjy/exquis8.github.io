import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, this.reviewMap});
  Map? reviewMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppHeight.h18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: AppWidth.w36,
                    height: AppHeight.h36,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: CachedNetworkImageShare(
                      urlImage: reviewMap!['image'].toString(),
                      heigthNumber: AppHeight.h36,
                      widthNumber: AppWidth.w36,
                      borderNumber: 0,
                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        reviewMap!['name_partner'].toString(),
                        color: AppColors.indicatorColor,
                        fontSize: 14,
                        fontWeight: AppFontWeight.medium,
                      ),
                      SizedBox(
                        height: AppHeight.h3,
                      ),
                      Row(
                        children: [
                          ...Common.getStarsList(
                              double.parse(reviewMap!['rating'].toString())),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              CustomText(
                reviewMap!['create_date'].toString(),
                color: AppColors.grey,
                fontSize: 10,
                fontWeight: AppFontWeight.regularOrNormal,
              )
            ],
          ),
          SizedBox(
            height: AppHeight.h14,
          ),
          CustomText(
            reviewMap!['comment'].toString(),
            color: AppColors.indicatorColor,
            fontSize: 14,
            fontWeight: AppFontWeight.regularOrNormal,
          )
        ],
      ),
    );
  }
}
