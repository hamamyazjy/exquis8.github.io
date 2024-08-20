// ignore_for_file: must_be_immutable

import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Controllers/hotel_controller.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/widgets/food_card.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RoomServiceMenuePage extends StatelessWidget {
  RoomServiceMenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(
        () => hotelController.itemMenuData.isEmpty
            ? const CustomCircularIndicatorWidget()
            : ListView(
                children: [
                  SizedBox(
                    height: AppHeight.h30,
                  ),
                  Stack(
                    children: [
                      CachedNetworkImageShare(
                        urlImage: Get.arguments['image'],
                        heigthNumber: AppHeight.h342,
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
                                child: Center(
                                  child: SvgPicture.asset(
                                    ImageAssetsSvgs.arrowLeftSvg,
                                    color: AppColors.white,
                                  ),
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
                                //     child: SvgPicture.asset(
                                //         ImageAssetsSvgs.favSvg),
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
                    height: AppHeight.h20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Choose what you want',
                          color: AppColors.indicatorColor,
                          fontSize: 24,
                          fontWeight: AppFontWeight.bold,
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
                        Center(
                          child: SizedBox(
                            width: AppWidth.w328,
                            child: CustomTextFormField(
                              hintText: 'Sreach for...',
                              topTitle: 'Search',
                              prefixIcon: SizedBox(
                                width: AppWidth.w20,
                                height: AppHeight.h20,
                                child: Center(
                                  child: SvgPicture.asset(
                                      ImageAssetsSvgs.searchSvg),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppHeight.h10,
                        ),
                        const Divider(
                          color: Color.fromRGBO(229, 231, 235, 1),
                          thickness: 1,
                        ),
                        SizedBox(
                          height: AppHeight.h20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount:
                              hotelController.itemMenuData['data'].length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => Container(
                            margin:
                                EdgeInsets.symmetric(vertical: AppHeight.h6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadius.r8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.15000000596046448),
                                    offset: Offset(0, 3),
                                    blurRadius: 11.699999809265137)
                              ],
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(190, 191, 194, 1),
                                width: 1,
                              ),
                            ),
                            child: Theme(
                              data: ThemeData()
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      hotelController.itemMenuData['data']
                                              [index]['category']
                                          .toString(),
                                      color: AppColors.indicatorColor,
                                      fontSize: 16,
                                      fontWeight: AppFontWeight.bold,
                                    ),
                                    // CustomText(
                                    //   '6:00 am - 10 : 00',
                                    //   color: AppColors.indicatorColor,
                                    //   fontSize: 10,
                                    //   fontWeight: AppFontWeight.regularOrNormal,
                                    // ),
                                  ],
                                ),
                                children: <Widget>[
                                  ...List.generate(
                                      hotelController
                                          .itemMenuData['data'][index]
                                              ['products']
                                          .length,
                                      (index2) => FoodCard(
                                            itemData: hotelController
                                                    .itemMenuData['data']
                                                [index]['products'][index2],
                                          ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(229, 231, 235, 1),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: AppHeight.h18,
                      ),
                      const Divider(
                        color: Color.fromRGBO(229, 231, 235, 1),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: AppHeight.h18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppWidth.w60, right: AppWidth.w16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: AppWidth.w30,
                                  height: AppHeight.h30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.btnColor,
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      '0',
                                      textAlign: TextAlign.center,
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: AppFontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppWidth.w10,
                                ),
                                CustomText(
                                  'in cart',
                                  color: AppColors.btnColor,
                                  fontSize: 14,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ],
                            ),
                            CustomButton(
                              width: AppWidth.w160,
                              height: AppHeight.h48,
                              title: 'Go to cart',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppHeight.h18,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
