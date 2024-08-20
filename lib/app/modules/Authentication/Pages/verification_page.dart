// ignore_for_file: must_be_immutable

import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: '',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                'Verify it’s you',
                color: AppColors.black,
                fontSize: 24,
                fontWeight: AppFontWeight.bold,
              ),
              SizedBox(height: AppHeight.h12),
              CustomText(
                'Please enter 6 digit verification code that have been sent to your mobile phone \n +62 827 7360 0182 ',
                color: AppColors.grey,
                textAlign: TextAlign.center,
                fontSize: 14,
                fontWeight: AppFontWeight.regularOrNormal,
              ),
              SizedBox(height: AppHeight.h50),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                backgroundColor: Colors.white,
                animationType: AnimationType.none,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(AppRadius.r16),
                  fieldHeight: AppHeight.h64,
                  fieldWidth: AppWidth.w64,
                  activeFillColor: Colors.white,
                  activeColor: AppColors.btnColor,
                  selectedColor: AppColors.grey2,
                  inactiveFillColor: AppColors.white,
                  selectedFillColor: AppColors.white,
                  errorBorderColor: AppColors.grey2,
                  borderWidth: 1,
                  disabledColor: AppColors.grey2,
                  inactiveColor: AppColors.grey2,
                ),
                cursorColor: AppColors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: textEditingController,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              SizedBox(height: AppHeight.h100),
              CustomButton(
                title: 'Submit',
                color: AppColors.btnColor.withOpacity(0.5),
                height: AppHeight.h48,
                onTap: () {
                  Get.toNamed(AppRoutes.mainPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
