import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String? title1;
  final String? title2;
  final String? title3;
  final int? isActive; //0=>left , 1 =>right
  final Function()? onPressedLeft;
  final Function()? onPressedrigth;
  final Function()? onPressed3;

  const CustomTab({
    Key? key,
    this.title1,
    this.title2,
    this.title3,
    this.isActive,
    this.onPressedLeft,
    this.onPressedrigth,
    this.onPressed3,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      // width: AppWidth.w340,
      height: AppHeight.h44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64.0),
        color: const Color(0xFFF4F4F4),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPressedLeft,
              child: Container(
                // width: 164.0,
                // height: 40.0,
                margin: EdgeInsets.symmetric(vertical: AppHeight.h4),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.0),
                  color: isActive == 0 ? Colors.white : Colors.transparent,
                  boxShadow: isActive == 0
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.11),
                            offset: Offset(0, 1.0),
                            blurRadius: 8.0,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: CustomText(
                    title1!,
                    fontSize: 16.0,
                    color: isActive == 0
                        ? AppColors.primaryColor
                        : Color(0xFF5E5E5E),
                    fontWeight:
                        isActive == 0 ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onPressedrigth,
              child: Container(
                // width: 164.0,
                // height: 40.0,
                margin: EdgeInsets.symmetric(vertical: AppHeight.h4),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.0),
                  color: isActive == 1 ? Colors.white : Colors.transparent,
                  boxShadow: isActive == 1
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.11),
                            offset: Offset(0, 1.0),
                            blurRadius: 8.0,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: CustomText(
                    title2!,
                    fontSize: 16.0,
                    color: isActive == 1
                        ? AppColors.primaryColor
                        : Color(0xFF5E5E5E),
                    fontWeight:
                        isActive == 1 ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          if (title3 != null)
            Expanded(
              child: GestureDetector(
                onTap: onPressed3,
                child: Container(
                  // width: 164.0,
                  // height: 40.0,
                  margin: EdgeInsets.symmetric(vertical: AppHeight.h4),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64.0),
                    color: isActive == 2 ? Colors.white : Colors.transparent,
                    boxShadow: isActive == 2
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.11),
                              offset: Offset(0, 1.0),
                              blurRadius: 8.0,
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: CustomText(
                      title3!,
                      fontSize: 16.0,
                      color: isActive == 2
                          ? AppColors.primaryColor
                          : Color(0xFF5E5E5E),
                      fontWeight:
                          isActive == 2 ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
