// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'as intl;

class CustomDateCalender extends StatelessWidget {
  CustomDateCalender(this.onTap);
  final Function? onTap;

  List<String> title = [
    'Year',
    'Month',
    'Date',
  ];
  String? dateSelect;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            'Check-in Date',
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
                      textDirection: TextDirection.rtl,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newdate) {
                          // log(newdate.toString());
                          dateSelect = newdate.toString();
                        },
                        dateOrder: DatePickerDateOrder.dmy,
                        use24hFormat: true,
                        maximumDate: DateTime(2050, 12, 30),
                        // minimumYear: 2010,
                        // maximumYear: 2018,
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.date,
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
                    // Parse the date string into a DateTime object
                    DateTime dateTime = DateTime.parse(dateSelect!);

                    // Create a DateFormat object with the desired format
                    intl.DateFormat formatter = intl.DateFormat('MMMM d, yyyy');

                    // Format the DateTime object to the desired format
                    String formattedDate = formatter.format(dateTime);

                    onTap!(formattedDate,dateSelect!.split(' ')[0]);
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
