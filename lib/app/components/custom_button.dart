// ignore_for_file: use_key_in_widget_constructors

import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final Color? color;
  final Color? colorText;
  final VoidCallback? onTap;
  const CustomButton({
    this.width,
    this.height,
    this.title,
    this.color,
    this.colorText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppWidth.w380,
        height: height ?? AppHeight.h58,
        decoration: BoxDecoration(
          color: color ?? AppColors.btnColor,
          borderRadius: BorderRadius.circular(AppRadius.r16),
        ),
        child: Center(
          child: CustomText(
            title ?? '',
            textAlign: TextAlign.center,
            color: colorText ?? AppColors.white,
            fontSize: 14,
            fontWeight: AppFontWeight.bold,
          
          ),
        ),
      ),
    );
  }
}
