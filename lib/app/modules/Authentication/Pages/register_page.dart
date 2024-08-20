import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: 'Add Your Info',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomTextFormField(
                hintText: 'Input First name',
                topTitle: 'First name',
              ),
            ),
            SizedBox(
              height: AppHeight.h18,
            ),
            Center(
              child: CustomTextFormField(
                hintText: 'Input First name',
                topTitle: 'Last name',
              ),
            ),
            SizedBox(
              height: AppHeight.h8,
            ),
            CustomText(
              'Make sure it matches the name on your government ID.',
              color: AppColors.grey,
              fontSize: 10,
              fontWeight: AppFontWeight.regularOrNormal,
            ),
            SizedBox(
              height: AppHeight.h18,
            ),
            Center(
              child: CustomTextFormField(
                hintText: 'Input Date of birth',
                topTitle: 'Date of birth',
                suffixIcon: SizedBox(
                  width: AppWidth.w20,
                  height: AppHeight.h20,
                  child: Center(
                    child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h18,
            ),
            CustomTextFormField(
              hintText: 'Input your email',
              topTitle: 'Email Address',
            ),
            SizedBox(
              height: AppHeight.h8,
            ),
            CustomText(
              'We’ll email you a reservation confirmation.',
              color: AppColors.grey,
              fontSize: 10,
              fontWeight: AppFontWeight.regularOrNormal,
            ),
            SizedBox(
              height: AppHeight.h110,
            ),
            CustomButton(
              title: 'Continue',
              color: AppColors.btnColor.withOpacity(0.5),
              height: AppHeight.h48,
              onTap: () {
                Get.toNamed(AppRoutes.verificationPage);
              },
            ),
            SizedBox(
              height: AppHeight.h15,
            ),
            Text.rich(
              TextSpan(
                  text: 'By clicking ',
                  style: GoogleFonts.redHatDisplay(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  children: [
                    TextSpan(
                      text: 'Continue, ',
                      style: GoogleFonts.redHatDisplay(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'I agree to Brooms ',
                      style: GoogleFonts.redHatDisplay(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Service ',
                      style: GoogleFonts.redHatDisplay(
                        color: AppColors.blueColor,
                        fontSize: 12.sp,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: GoogleFonts.redHatDisplay(
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: GoogleFonts.redHatDisplay(
                        color: AppColors.blueColor,
                        fontSize: 12.sp,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                    ),
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}
