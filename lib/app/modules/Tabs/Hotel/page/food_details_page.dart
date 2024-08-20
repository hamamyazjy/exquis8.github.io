// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FoodDetailsPage extends StatefulWidget {
  FoodDetailsPage({super.key});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Get.arguments == null
          ? const CustomCircularIndicatorWidget()
          : ListView(
              children: [
                SizedBox(
                  height: AppHeight.h30,
                ),
                Stack(
                  children: [
                    CachedNetworkImageShare(
                      urlImage: Get.arguments['item']['image_url'],
                      heigthNumber: AppHeight.h250,
                      widthNumber: double.infinity,
                      borderNumber: 0.1,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(6.123234262925839e-17, 1),
                          end: Alignment(-1, 6.123234262925839e-17),
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.5799999833106995),
                            Color.fromRGBO(0, 0, 0, 1)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidth.w24, vertical: AppHeight.h16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: AppWidth.w32,
                              height: AppHeight.h32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.indicatorColor,
                              ),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: AppWidth.w32,
                                height: AppHeight.h32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.indicatorColor,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                      ImageAssetsSvgs.shareSvg),
                                ),
                              ),
                              SizedBox(
                                width: AppWidth.w10,
                              ),
                              // Container(
                              //   width: AppWidth.w32,
                              //   height: AppHeight.h32,
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     color: AppColors.indicatorColor,
                              //   ),
                              //   child: Center(
                              //     child:
                              //         SvgPicture.asset(ImageAssetsSvgs.favSvg),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppHeight.h15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        Get.arguments['item']['name'],
                        textAlign: TextAlign.left,
                        color: AppColors.indicatorColor,
                        fontSize: 24,
                        fontWeight: AppFontWeight.bold,
                      ),
                      SizedBox(
                        height: AppHeight.h8,
                      ),
                      CustomText(
                        Get.arguments['item']['description_text'],
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      const Divider(
                        color: Color.fromRGBO(229, 231, 235, 1),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      CustomText(
                        'Contains :',
                        fontSize: 16,
                        color: AppColors.indicatorColor,
                        fontWeight: AppFontWeight.bold,
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      CustomText(
                        """. (V): Vegetarian
. Milk and dairy products
. (MT): Vitality""",
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: AppFontWeight.bold,
                      ),
                      SizedBox(
                        height: AppHeight.h15,
                      ),
                      const Divider(
                        color: Color.fromRGBO(229, 231, 235, 1),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      Center(
                        child: SizedBox(
                          width: AppWidth.w328,
                          child: CustomTextFormField(
                            enable: false,
                            hintText: 'Large',
                            topTitle: 'Size of the bowl',
                            prefixIcon: SizedBox(
                              width: AppWidth.w20,
                              height: AppHeight.h20,
                              child: Center(
                                child: SvgPicture.asset(
                                    ImageAssetsSvgs.servicesSvg),
                              ),
                            ),
                            // suffixIcon: SizedBox(
                            //   width: AppWidth.w20,
                            //   height: AppHeight.h20,
                            //   child: Center(
                            //     child: Icon(
                            //       Icons.arrow_drop_down,
                            //       color: AppColors.grey,
                            //       size: AppRadius.r14,
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppHeight.h10,
                      ),
                      Center(
                        child: SizedBox(
                          width: AppWidth.w328,
                          child: CustomTextFormField(
                            hintText: 'Your note....',
                            topTitle: 'Note',
                            maxLine: 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppHeight.h20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppWidth.w13),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (quantity != 0) {
                                      quantity--;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: AppWidth.w30,
                                    height: AppHeight.h30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: AppColors.redColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        '-',
                                        textAlign: TextAlign.center,
                                        color: AppColors.redColor,
                                        fontSize: 14,
                                        fontWeight: AppFontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppWidth.w8,
                                ),
                                CustomText(
                                  '$quantity',
                                  fontSize: 24,
                                  color: AppColors.indicatorColor,
                                  fontWeight: AppFontWeight.bold,
                                ),
                                SizedBox(
                                  width: AppWidth.w8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    quantity++;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: AppWidth.w30,
                                    height: AppHeight.h30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: AppColors.btnColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        '+',
                                        textAlign: TextAlign.center,
                                        color: AppColors.btnColor,
                                        fontSize: 14,
                                        fontWeight: AppFontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: AppWidth.w160,
                            height: AppHeight.h48,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r16),
                              color: AppColors.white,
                              border: Border.all(
                                color: AppColors.btnColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                '${quantity * Get.arguments['item']['price']} \$',
                                color: AppColors.btnColor,
                                fontWeight: AppFontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppHeight.h20,
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
                      title: 'Add to Cart',
                      width: AppWidth.w330,
                      height: AppHeight.h50,
                    ),
                    SizedBox(
                      height: AppHeight.h25,
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
