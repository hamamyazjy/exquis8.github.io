import 'dart:convert';

import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/Controllers/services_controller.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  ServicesController servicesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppHeight.h12,
                  ),
                  CustomText(
                    'welcome to services',
                    color: AppColors.blueColor,
                    fontSize: 16,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  SizedBox(
                    height: AppHeight.h12,
                  ),
                  CustomText(
                    'How can we help you ?',
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: AppFontWeight.bold,
                  ),
                  SizedBox(
                    height: AppHeight.h12,
                  ),
                  CustomText(
                    'We are always ready to help you.\n You can request whatever you wish to \nmake your visit perfect..',
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: AppFontWeight.regularOrNormal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppHeight.h40,
            ),
            Obx(() => servicesController.servicesHotelData.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: Get.height / 5,
                      ),
                      const CustomCircularIndicatorWidget(),
                    ],
                  )
                : GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                    crossAxisCount: 2,
                    mainAxisSpacing: AppHeight.h24,
                    crossAxisSpacing: AppWidth.w24,
                    children: [
                      ...List.generate(
                        servicesController.servicesHotelData['data'].length,
                        (index) => GestureDetector(
                          onTap: () {
                            servicesController.getServicesLaundryHotel(
                                servicesController.servicesHotelData['data']
                                        [index]['title']
                                    .toString());
                            Get.toNamed(AppRoutes.laundryPage,
                                arguments: servicesController
                                    .servicesHotelData['data'][index]);
                          },
                          child: Container(
                            width: AppWidth.w150,
                            height: AppHeight.h150,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey2),
                              borderRadius: BorderRadius.circular(
                                AppRadius.r20,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.memory(
                                  base64Decode(servicesController
                                      .servicesHotelData['data'][index]['icon']
                                      .toString()),
                                  width: AppWidth.w56,
                                  height: AppHeight.h56,
                                ),
                                SizedBox(
                                  height: AppHeight.h13,
                                ),
                                Center(
                                  child: CustomText(
                                    servicesController.servicesHotelData['data']
                                            [index]['title']
                                        .toString(),
                                    color: AppColors.indicatorColor,
                                    fontSize: 16,
                                    fontWeight: AppFontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            SizedBox(
              height: AppHeight.h100,
            ),
          ],
        ),
      ),
    );
  }
}
