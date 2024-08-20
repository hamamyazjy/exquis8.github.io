import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_loading.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Controllers/profile_controller.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: ListView(
          children: [
            Obx(
              () => profileController.accountData.isEmpty
                  ? const CustomCircularIndicatorWidget()
                  : Row(
                      children: [
                        Container(
                          width: AppWidth.w64,
                          height: AppHeight.h64,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImageShare(
                            urlImage:
                                profileController.accountData['image_url'],
                            widthNumber: AppWidth.w64,
                            heigthNumber: AppHeight.h64,
                            borderNumber: 0,
                          ),
                        ),
                        SizedBox(
                          width: AppWidth.w20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                             profileController.accountData['name'].toString(),
                              textAlign: TextAlign.left,
                              color: AppColors.indicatorColor,
                              fontSize: 20,
                              fontWeight: AppFontWeight.bold,
                            ),
                            SizedBox(
                              height: AppHeight.h4,
                            ),
                            CustomText(
                              profileController.accountData['email'].toString(),
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: AppFontWeight.regularOrNormal,
                            ),
                          ],
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: AppHeight.h34,
            ),
            ListView.builder(
              itemCount: profileController.profileMenu.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.toNamed(AppRoutes.personalInformationPage);

                      break;
                    case 1:
                      // Get.toNamed(AppRoutes.aboutAccommodationPage);

                      break;
                    default:
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppHeight.h20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: AppWidth.w24,
                            height: AppHeight.h24,
                            child: SvgPicture.asset(
                              profileController.profileMenu[index]['image']!,
                            ),
                          ),
                          SizedBox(
                            width: AppWidth.w20,
                          ),
                          CustomText(
                            profileController.profileMenu[index]['name'],
                            color: AppColors.indicatorColor,
                            fontSize: 14,
                            fontWeight: AppFontWeight.regularOrNormal,
                          )
                        ],
                      ),
                      SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                            size: AppRadius.r14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h55,
            ),
            // Container(
            //   height: AppHeight.h48,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(AppRadius.r16),
            //     color: AppColors.white,
            //     border: Border.all(
            //       color: AppColors.redColor,
            //       width: 1,
            //     ),
            //   ),
            //   child: Center(
            //     child: CustomText(
            //       'Sign Out',
            //       color: AppColors.redColor,
            //       fontWeight: AppFontWeight.bold,
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
