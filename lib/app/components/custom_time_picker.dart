// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'dart:developer';

import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTimeCalender extends StatelessWidget {
  CustomTimeCalender(this.onTap);
  final Function? onTap;

  List<String> title = ['Hour', 'Minute'];
  Duration selectedDuration = Duration(hours: 1, minutes: 0, seconds: 0);
  Map _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return {
      'timeSend': "$hours:$minutes:$seconds",
      'timeShow': "$hours:$minutes",
    };
  }

  String? timeSelect;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            'Check-in Time',
            color: AppColors.indicatorColor,
            fontSize: 16,
            fontWeight: AppFontWeight.bold,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.close,
              color: AppColors.grey,
            ),
          )
        ],
      ),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r16),
        child: SizedBox(
          height: AppHeight.h260,
          width: AppWidth.w343,
          child: Column(
            children: [
              SizedBox(
                height: AppHeight.h10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...title.map(
                        (e) => CustomText(
                          e,
                          color: AppColors.indicatorColor,
                          fontSize: 14,
                          fontWeight: AppFontWeight.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppHeight.h150,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode
                            .hm, // You can choose hms, ms, or s modes
                        initialTimerDuration: selectedDuration,
                        minuteInterval: 1,
                        secondInterval: 1,
                        onTimerDurationChanged: (Duration newDuration) {
                          selectedDuration = newDuration;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppHeight.h28,
                  ),
                ],
              ),
              Center(
                child: CustomButton(
                  title: 'Save',
                  height: AppHeight.h48,
                  onTap: () {
                    Map formattedTime = _formatDuration(selectedDuration);

                    onTap!(
                        formattedTime['timeShow'], formattedTime['timeSend']);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
