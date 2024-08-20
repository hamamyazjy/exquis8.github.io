// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Controllers/Authentication_controller.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeight.h80,
              ),
              SvgPicture.asset(ImageAssetsSvgs.logoSvg),
              SizedBox(
                height: AppHeight.h60,
              ),
              CustomText(
                'Login or sign up',
                fontSize: 24,
                fontWeight: AppFontWeight.bold,
                color: AppColors.indicatorColor,
              ),
              SizedBox(
                height: AppHeight.h12,
              ),
              CustomText(
                'I am so happy to see. You can continue to login for find your destination.',
                color: AppColors.grey,
                fontSize: 14,
                fontWeight: AppFontWeight.regularOrNormal,
              ),
              SizedBox(
                height: AppHeight.h48,
              ),
              Center(
                child: CustomTextFormField(
                  hintText: 'Input phone number',
                  topTitle: 'Phone number',
                ),
              ),
              SizedBox(
                height: AppHeight.h24,
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
                height: AppHeight.h40,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: Get.width / 4,
                    child: const Divider(
                      color: Color.fromRGBO(229, 231, 235, 1),
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w18,
                  ),
                  CustomText(
                    'Or continue with',
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  SizedBox(
                    width: AppWidth.w18,
                  ),
                  SizedBox(
                    width: Get.width / 4,
                    child: const Divider(
                      color: Color.fromRGBO(229, 231, 235, 1),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppHeight.h40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: AppHeight.h44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.grey2,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssetsSvgs.googleSvg,
                          ),
                          SizedBox(
                            width: AppWidth.w12,
                          ),
                          CustomText(
                            'Google',
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: AppFontWeight.regularOrNormal,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w20,
                  ),
                  Expanded(
                    child: Container(
                      height: AppHeight.h44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.grey2,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssetsSvgs.facebookSvg,
                          ),
                          SizedBox(
                            width: AppWidth.w12,
                          ),
                          CustomText(
                            'Facebook',
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: AppFontWeight.regularOrNormal,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppHeight.h10,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.mainPage);
                },
                child: Container(
                  height: AppHeight.h44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.grey2,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageAssetsSvgs.profileSvg,
                      ),
                      SizedBox(
                        width: AppWidth.w12,
                      ),
                      CustomText(
                        'Continue as a guset',
                        color: AppColors.grey,
                        fontWeight: AppFontWeight.regularOrNormal,
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.h50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Don’t Have an account?',
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: AppFontWeight.regularOrNormal,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.registerPage);
                    },
                    child: CustomText(
                      'Register',
                      color: AppColors.btnColor,
                      fontFamily: 'Red Hat Display',
                      fontSize: 14,
                      fontWeight: AppFontWeight.medium,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
