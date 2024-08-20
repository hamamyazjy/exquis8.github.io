import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Controllers/hotel_controller.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/widgets/home_card.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/widgets/slider_hotel.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  HotelController hotelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppHeight.h25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'welcome to, number room is ${int.tryParse(Uri.base.pathSegments.isNotEmpty ? Uri.base.pathSegments[0] : '') ?? ''}',
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  SizedBox(
                    height: AppHeight.h6,
                  ),
                  SvgPicture.asset(
                    ImageAssetsSvgs.logoSvg,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppHeight.h8,
            ),
            hotelController.mainPageData.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: Get.height / 3.5,
                      ),
                      const CustomCircularIndicatorWidget(),
                    ],
                  )
                : Column(
                    children: [
                      SliderHotelWidget(
                        autoPlay: true,
                        isHome: true,
                        images: hotelController.images,
                      ),
                      SizedBox(
                        height: AppHeight.h30,
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
                                child:
                                    SvgPicture.asset(ImageAssetsSvgs.searchSvg),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppHeight.h30,
                      ),
                      hotelController.mainPageData['data'].length == 0
                          ? Container()
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.zero,
                              itemCount:
                                  hotelController.mainPageData['data'].length,
                              itemBuilder: (context, index) => HomeCard(
                                index: hotelController.mainPageData['data']
                                    [index]['order'],
                                image: hotelController.mainPageData['data']
                                    [index]['image_url'],
                                title: hotelController.mainPageData['data']
                                    [index]['name'],
                              ),
                            ),
                      SizedBox(
                        height: AppHeight.h100,
                      ),
                    ],
                  )
          ],
        ),
      )),
    );
  }
}
