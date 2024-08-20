import 'dart:convert';

import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Controllers/hotel_controller.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/widgets/review_card.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/widgets/slider_hotel.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.find();

    return Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(
          () => hotelController.hotelDetails.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: Get.height / 2,
                    ),
                    const CustomCircularIndicatorWidget(),
                  ],
                )
              : ListView(
                  children: [
                    SizedBox(
                      height: AppHeight.h30,
                    ),
                    Stack(
                      children: [
                        SliderHotelWidget(
                          autoPlay: true,
                          isHome: false,
                          images: hotelController.images,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidth.w24,
                              vertical: AppHeight.h16),
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
                                  )),
                                ),
                              ),
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
                            hotelController.hotelDetails['name'].toString(),
                            color: AppColors.indicatorColor,
                            fontSize: 24,
                            fontWeight: AppFontWeight.bold,
                          ),
                          SizedBox(
                            height: AppHeight.h20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(ImageAssetsSvgs.mapSolidSvg),
                                  SizedBox(
                                    width: AppWidth.w6,
                                  ),
                                  CustomText(
                                    hotelController.hotelDetails['location']
                                        .toString(),
                                    textAlign: TextAlign.left,
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: AppFontWeight.regularOrNormal,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImageAssetsSvgs.starSvg),
                                  CustomText(
                                    '${hotelController.hotelDetails['av_rating'].toString()} (${hotelController.hotelDetails['reviews'].length})',
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: AppFontWeight.regularOrNormal,
                                  ),
                                  SizedBox(
                                    width: AppWidth.w60,
                                  ),
                                ],
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: AppHeight.h11,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: <Widget>[
                          //     CustomText(
                          //       '800 \$',
                          //       color: AppColors.btnColor,
                          //       fontSize: 16,
                          //       fontWeight: AppFontWeight.bold,
                          //     ),
                          //     SizedBox(width: AppWidth.w2),
                          //     CustomText(
                          //       '/night',
                          //       color: AppColors.grey,
                          //       fontSize: 14,
                          //       fontWeight: AppFontWeight.regularOrNormal,
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          const Divider(
                            color: Color.fromRGBO(229, 231, 235, 1),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          CustomText(
                            'Description',
                            textAlign: TextAlign.left,
                            color: AppColors.indicatorColor,
                            fontSize: 16,
                            fontWeight: AppFontWeight.bold,
                          ),
                          SizedBox(
                            height: AppHeight.h8,
                          ),
                          ReadMoreText(
                            hotelController.hotelDetails['information']
                                .toString(),
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            lessStyle: GoogleFonts.redHatDisplay(
                              fontSize: 12.sp,
                              fontWeight: AppFontWeight.regularOrNormal,
                              color: AppColors.redColor,
                            ),
                            style: GoogleFonts.redHatDisplay(
                              fontSize: 14.sp,
                              fontWeight: AppFontWeight.regularOrNormal,
                              color: AppColors.grey,
                            ),
                            moreStyle: GoogleFonts.redHatDisplay(
                              fontSize: 12.sp,
                              fontWeight: AppFontWeight.regularOrNormal,
                              color: AppColors.btnColor,
                            ),
                          ),
                          SizedBox(
                            height: AppHeight.h20,
                          ),
                          const Divider(
                            color: Color.fromRGBO(229, 231, 235, 1),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: AppHeight.h20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                ' Facilities',
                                color: AppColors.indicatorColor,
                                fontSize: 16,
                                fontWeight: AppFontWeight.bold,
                              ),
                              CustomText(
                                'See Detail',
                                textAlign: TextAlign.center,
                                color: AppColors.btnColor,
                                fontSize: 12,
                                fontWeight: AppFontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppHeight.h25,
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            crossAxisCount: 4,
                            padding: EdgeInsets.zero,
                            children: [
                              ...List.generate(
                                hotelController
                                    .hotelDetails['facilities'].length,
                                (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.memory(
                                      base64Decode(
                                        hotelController
                                                .hotelDetails['facilities']
                                            [index]['icon']!,
                                      ),
                                      height: AppHeight.h28,
                                      width: AppWidth.w28,
                                    ),
                                    SizedBox(height: AppHeight.h8),
                                    CustomText(
                                      hotelController.hotelDetails['facilities']
                                          [index]['title']!,
                                      color: AppColors.indicatorColor,
                                      fontSize: 10,
                                      fontWeight: AppFontWeight.regularOrNormal,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          // const Divider(
                          //   color: Color.fromRGBO(229, 231, 235, 1),
                          //   thickness: 1,
                          // ),
                          // SizedBox(
                          //   height: AppHeight.h15,
                          // ),
                          // CustomText(
                          //   'About Accommodation',
                          //   color: AppColors.indicatorColor,
                          //   fontSize: 16,
                          //   fontWeight: AppFontWeight.bold,
                          // ),
                          // SizedBox(
                          //   height: AppHeight.h25,
                          // ),
                          // SizedBox(
                          //   width: AppWidth.w375,
                          //   height: AppHeight.h80,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: <Widget>[
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           CustomText(
                          //             'Check-in',
                          //             color: AppColors.grey,
                          //             fontSize: 12,
                          //             fontWeight: AppFontWeight.medium,
                          //           ),
                          //           SizedBox(
                          //             height: AppHeight.h8,
                          //           ),
                          //           CustomText(
                          //             '15 July 2024',
                          //             color: AppColors.indicatorColor,
                          //             fontSize: 16,
                          //             fontWeight: AppFontWeight.regularOrNormal,
                          //           ),
                          //         ],
                          //       ),
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           CustomText(
                          //             'Check-out',
                          //             color: AppColors.grey,
                          //             fontSize: 12,
                          //             fontWeight: AppFontWeight.medium,
                          //           ),
                          //           SizedBox(
                          //             height: AppHeight.h8,
                          //           ),
                          //           CustomText(
                          //             '15 July 2024',
                          //             color: AppColors.indicatorColor,
                          //             fontSize: 16,
                          //             fontWeight: AppFontWeight.regularOrNormal,
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: AppHeight.h20,
                          // ),
                          // SizedBox(
                          //   width: AppWidth.w375,
                          //   height: AppHeight.h80,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: <Widget>[
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           CustomText(
                          //             'Guests',
                          //             color: AppColors.grey,
                          //             fontSize: 12,
                          //             fontWeight: AppFontWeight.medium,
                          //           ),
                          //           SizedBox(
                          //             height: AppHeight.h8,
                          //           ),
                          //           CustomText(
                          //             '2 Guests/room',
                          //             color: AppColors.black,
                          //             fontSize: 16,
                          //             fontWeight: AppFontWeight.regularOrNormal,
                          //           ),
                          //         ],
                          //       ),
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           CustomText(
                          //             'Bed Type',
                          //             color: AppColors.grey,
                          //             fontSize: 12,
                          //             fontWeight: AppFontWeight.medium,
                          //           ),
                          //           SizedBox(
                          //             height: AppHeight.h8,
                          //           ),
                          //           CustomText(
                          //             '1 Double',
                          //             color: AppColors.black,
                          //             fontSize: 16,
                          //             fontWeight: AppFontWeight.regularOrNormal,
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          const Divider(
                            color: Color.fromRGBO(229, 231, 235, 1),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                ' Reviews',
                                color: AppColors.indicatorColor,
                                fontSize: 16,
                                fontWeight: AppFontWeight.bold,
                              ),
                              CustomText(
                                'See All',
                                textAlign: TextAlign.center,
                                color: AppColors.btnColor,
                                fontSize: 12,
                                fontWeight: AppFontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          ListView.builder(
                            itemCount:
                                hotelController.hotelDetails['reviews'].length,
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => ReviewCard(
                              reviewMap: hotelController.hotelDetails['reviews']
                                  [index],
                            ),
                          ),
                          const Divider(
                            color: Color.fromRGBO(229, 231, 235, 1),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                          CustomText(
                            'CONTACT US',
                            color: AppColors.indicatorColor,
                            fontSize: 16,
                            fontWeight: AppFontWeight.bold,
                          ),
                          SizedBox(
                            height: AppHeight.h15,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: AppHeight.h10,
                    // ),
                    // ListView.builder(
                    //   itemCount: 2,
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   padding: EdgeInsets.zero,
                    //   itemBuilder: (context, index) => RoomTypeCard(
                    //     image: hotelController.images[0],
                    //   ),
                    // ),
                    SizedBox(
                      height: AppHeight.h7,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Telephone',
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: AppFontWeight.bold,
                          ),
                          CustomText(
                            hotelController.hotelDetails['mobile'],
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h7,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Email',
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: AppFontWeight.bold,
                          ),
                          CustomText(
                            hotelController.hotelDetails['email'],
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h30,
                    ),
                  ],
                ),
        ));
  }
}
