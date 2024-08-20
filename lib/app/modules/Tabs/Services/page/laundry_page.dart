import 'dart:convert';

import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_date_picker.dart';
import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/components/custom_time_picker.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/Controllers/services_controller.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LaundryPage extends StatefulWidget {
  const LaundryPage({super.key});

  @override
  State<LaundryPage> createState() => _LaundryPageState();
}

class _LaundryPageState extends State<LaundryPage> {
  String? showDate;
  String? dateSend;

  String? showTime;
  String? timeSend;

  @override
  Widget build(BuildContext context) {
    ServicesController servicesController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: Get.arguments['title'],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppHeight.h50, horizontal: AppWidth.w24),
        child: CustomButton(
          // width: AppWidth.w160,
          height: AppHeight.h48,
          title: 'Continue',
          onTap: () {
            if (dateSend == null) {
              Common.showNotoficationDialog(
                'Error',
                'Please select the Date',
                Colors.red,
              );
            } else if (timeSend == null) {
              Common.showNotoficationDialog(
                'Error',
                'Please select the Time',
                Colors.red,
              );
            } else if (servicesController.idServicesLaundryList.length == 0) {
              Common.showNotoficationDialog(
                'Error',
                'Please select Services',
                Colors.red,
              );
            } else {
              servicesController.addRequestOrder({
                "request_time": "$dateSend $timeSend",
                "services_ids": servicesController.idServicesLaundryList
              });
            }
          },
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     // Row(
        //     //   children: [
        //     //     Container(
        //     //       width: AppWidth.w30,
        //     //       height: AppHeight.h30,
        //     //       decoration: BoxDecoration(
        //     //         shape: BoxShape.circle,
        //     //         color: AppColors.btnColor,
        //     //       ),
        //     //       child: Center(
        //     //         child: CustomText(
        //     //           '${servicesController.totalPriceLaundry.value}',
        //     //           textAlign: TextAlign.center,
        //     //           color: AppColors.white,
        //     //           fontSize: 14,
        //     //           fontWeight: AppFontWeight.bold,
        //     //         ),
        //     //       ),
        //     //     ),
        //     //     SizedBox(
        //     //       width: AppWidth.w10,
        //     //     ),
        //     //     CustomText(
        //     //       '\$',
        //     //       color: AppColors.btnColor,
        //     //       fontSize: 14,
        //     //       fontWeight: AppFontWeight.bold,
        //     //     ),
        //     //   ],
        //     // ),

        //   ],
        // ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
          child: Obx(
            () => ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.memory(
                      base64Decode(Get.arguments['icon']),
                      width: AppWidth.w40,
                      height: AppHeight.h40,
                    ),
                    SizedBox(
                      height: AppHeight.h13,
                    ),
                    Center(
                      child: CustomText(
                        Get.arguments['title'],
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
                  Get.arguments['information'],
                  color: AppColors.grey,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  fontWeight: AppFontWeight.regularOrNormal,
                ),
                SizedBox(
                  height: AppHeight.h30,
                ),
                CustomText(
                  'Request time',
                  color: AppColors.indicatorColor,
                  fontSize: 12,
                  fontWeight: AppFontWeight.medium,
                ),
                SizedBox(
                  height: AppHeight.h8,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          useRootNavigator: false,
                          context: context,
                          builder: (c) => CustomDateCalender(
                            (String dateShow, String dateSend) {
                              this.showDate = dateShow;
                              this.dateSend = dateSend;
                              setState(() {});
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: AppWidth.w204,
                        height: AppHeight.h44,
                        padding:
                            EdgeInsets.symmetric(horizontal: AppHeight.h18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r14),
                          border: Border.all(
                            width: 1.0,
                            color: AppColors.grey2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              showDate ?? ' ',
                              color: AppColors.indicatorColor,
                              fontSize: 14,
                              fontWeight: AppFontWeight.regularOrNormal,
                            ),
                            SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppWidth.w10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          useRootNavigator: false,
                          context: context,
                          builder: (c) => CustomTimeCalender(
                            (String timeShow, String timeSend) {
                              this.showTime = timeShow;
                              this.timeSend = timeSend;
                              setState(() {});
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: AppHeight.h44,
                        width: AppWidth.w110,
                        padding:
                            EdgeInsets.symmetric(horizontal: AppHeight.h18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r14),
                          border: Border.all(
                            width: 1.0,
                            color: AppColors.grey2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              showTime ?? ' ',
                              color: AppColors.indicatorColor,
                              fontSize: 14,
                              fontWeight: AppFontWeight.regularOrNormal,
                            ),
                            SvgPicture.asset(ImageAssetsSvgs.timeSvg),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppHeight.h22,
                ),
                CustomText(
                  'Services',
                  color: AppColors.indicatorColor,
                  fontSize: 16,
                  fontWeight: AppFontWeight.bold,
                ),
                SizedBox(
                  height: AppHeight.h18,
                ),
                CustomTextFormField(
                  hintText: 'Sreach for...',
                  topTitle: 'Search',
                  prefixIcon: SizedBox(
                    width: AppWidth.w20,
                    height: AppHeight.h20,
                    child: Center(
                      child: SvgPicture.asset(ImageAssetsSvgs.searchSvg),
                    ),
                  ),
                  suffixIcon: SizedBox(
                    width: AppWidth.w20,
                    height: AppHeight.h20,
                    child: Center(
                      child: SvgPicture.asset(ImageAssetsSvgs.filterSvg),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppHeight.h18,
                ),
                servicesController.servicesLaundryHotelData.isEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: Get.height / 9,
                          ),
                          const CustomCircularIndicatorWidget(),
                        ],
                      )
                    : ListView.builder(
                        itemCount: servicesController
                            .servicesLaundryHotelData['data'].length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: servicesController
                                        .idServicesLaundryList
                                        .contains(servicesController
                                            .servicesLaundryHotelData['data']
                                                [index]['id']
                                            .toString()),
                                    activeColor: AppColors.grey,
                                    onChanged: (value) {
                                      servicesController
                                          .checkIdServicesLaundryList(
                                              servicesController
                                                  .servicesLaundryHotelData[
                                                      'data'][index]['id']
                                                  .toString(),
                                              servicesController
                                                  .servicesLaundryHotelData[
                                                      'data'][index]['price']
                                                  .toString());
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: AppHeight.h15,
                                ),
                                CustomText(
                                  servicesController
                                      .servicesLaundryHotelData['data'][index]
                                          ['name']
                                      .toString(),
                                  color: AppColors.indicatorColor,
                                  fontSize: 16,
                                  fontWeight: AppFontWeight.regularOrNormal,
                                ),
                              ],
                            ),
                            // CustomText(
                            //   '${servicesController.servicesLaundryHotelData['data'][index]['price']} \$',
                            //   color: AppColors.btnColor,
                            //   fontSize: 16,
                            //   fontWeight: AppFontWeight.bold,
                            // ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: AppHeight.h18,
                ),
              ],
            ),
          )),
    );
  }
}
