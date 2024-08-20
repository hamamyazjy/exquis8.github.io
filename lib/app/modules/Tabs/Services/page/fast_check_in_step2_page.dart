// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FastCheckInStep2 extends StatelessWidget {
  // const FastCheckInStep2({super.key});
  int nationalityGroup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: 'Fast check-in',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: AppWidth.w52,
                          height: AppHeight.h52,
                          child:
                              SvgPicture.asset(ImageAssetsSvgs.profileSolidSvg),
                        ),
                        SizedBox(
                          width: AppWidth.w8,
                        ),
                        CustomText(
                          'Person info',
                          fontSize: 18,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppHeight.h8,
                    ),
                    CustomText(
                      'Enter the information of the person making the reservation',
                      fontSize: 16,
                      fontWeight: AppFontWeight.regularOrNormal,
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
                    CustomText(
                      'The nationality',
                      fontSize: 12,
                      fontWeight: AppFontWeight.medium,
                    ),
                    SizedBox(
                      height: AppHeight.h8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 0,
                            activeColor: AppColors.btnColor,
                            title: CustomText(
                              'Turkish',
                              color: AppColors.indicatorColor,
                              fontSize: 14,
                              fontWeight: AppFontWeight.regularOrNormal,
                            ),
                            groupValue: nationalityGroup,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 1,
                            activeColor: AppColors.btnColor,
                            title: CustomText(
                              'Foreigner',
                              color: AppColors.indicatorColor,
                              fontSize: 14,
                              fontWeight: AppFontWeight.regularOrNormal,
                            ),
                            groupValue: nationalityGroup,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'ID number',
                      textInitialValue: 'Mohamed',
                      topTitle: 'ID number',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.profileSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'March 24, 1990',
                      textInitialValue: 'March 24, 1990',
                      topTitle: 'Date of birth',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'Address',
                      textInitialValue: 'Address',
                      topTitle: 'Address',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'Post code',
                      textInitialValue: 'Post code',
                      topTitle: 'Post code',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'City',
                      textInitialValue: 'City',
                      topTitle: 'City',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'Phone number',
                      textInitialValue: 'Phone number',
                      topTitle: 'Phone number',
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      textInitialValue: 'Email',
                      topTitle: 'Email',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'March 24, 1990',
                      textInitialValue: 'March 24, 1990',
                      topTitle: 'Check-in date',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h20,
                    ),
                    CustomTextFormField(
                      hintText: 'March 24, 1990',
                      textInitialValue: 'March 24, 1990',
                      topTitle: 'Check-out date',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                child: CustomButton(
                  title: 'Continue',
                  height: AppHeight.h48,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: AppHeight.h40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
