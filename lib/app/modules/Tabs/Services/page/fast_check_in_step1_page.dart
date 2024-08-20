import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FastCheckInStep1 extends StatelessWidget {
  const FastCheckInStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: ' ',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageAssetsSvgs.fastCheckInSvg,
                        width: AppWidth.w40,
                        height: AppHeight.h40,
                      ),
                      SizedBox(
                        width: AppWidth.w13,
                      ),
                      Center(
                        child: CustomText(
                          'Fast check-in',
                          color: AppColors.indicatorColor,
                          fontSize: 16,
                          fontWeight: AppFontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppHeight.h12,
                  ),
                  CustomText(
                    "Lorem Ipsum is simply dummy text of the ssdsdprinting and typesetting industry. Lorem Ipsum has been the industry's ",
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  SizedBox(
                    height: AppHeight.h30,
                  ),
                  CustomText(
                    'How many people have you reserved ?',
                    color: AppColors.indicatorColor,
                    fontSize: 16,
                    fontWeight: AppFontWeight.bold,
                  ),
                  SizedBox(
                    height: AppHeight.h8,
                  ),
                  const Divider(
                    color: Color.fromRGBO(229, 231, 235, 1),
                    thickness: 1,
                  ),
                  SizedBox(
                    height: AppHeight.h8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Adults',
                            color: AppColors.indicatorColor,
                            fontSize: 13,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                          CustomText(
                            'Ages 16 or above',
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: AppFontWeight.regularOrNormal,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: AppWidth.w24,
                            height: AppHeight.h24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.grey2),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            width: AppWidth.w14,
                          ),
                          CustomText(
                            '0',
                            color: AppColors.indicatorColor,
                            fontSize: 16,
                            fontWeight: AppFontWeight.regularOrNormal,
                          ),
                          SizedBox(
                            width: AppWidth.w14,
                          ),
                          Container(
                            width: AppWidth.w24,
                            height: AppHeight.h24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.btnColor),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppHeight.h15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Kid',
                            color: AppColors.indicatorColor,
                            fontSize: 13,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                          CustomText(
                            'Ages 15 or below',
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: AppFontWeight.regularOrNormal,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: AppWidth.w24,
                            height: AppHeight.h24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.grey2),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            width: AppWidth.w14,
                          ),
                          CustomText(
                            '0',
                            color: AppColors.indicatorColor,
                            fontSize: 16,
                            fontWeight: AppFontWeight.regularOrNormal,
                          ),
                          SizedBox(
                            width: AppWidth.w14,
                          ),
                          Container(
                            width: AppWidth.w24,
                            height: AppHeight.h24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.btnColor),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  color: Color.fromRGBO(229, 231, 235, 1),
                  thickness: 1,
                ),
                SizedBox(
                  height: AppHeight.h18,
                ),
                CustomButton(
                  title: 'Continue',
                  height: AppHeight.h48,
                  onTap: () {
                    Get.toNamed(AppRoutes.fastCheckInStep2);
                  },
                ),
                SizedBox(
                  height: AppHeight.h25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
