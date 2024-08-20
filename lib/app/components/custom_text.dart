import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final bool? underline;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final int? maxLines;

  final double? height;
  CustomText(
    this.text, {
    this.fontSize,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.height,
    this.underline = false,
    this.maxLines,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!.tr,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: fontFamily == 'Urbanist'
          ? GoogleFonts.urbanist(
              height: height,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize!.sp, decorationThickness: 4,
              color: color ?? Colors.black,
              // fontFamily: fontFamily??'Red Hat Display',
              // height: 1,
              decoration:
                  underline! ? TextDecoration.underline : TextDecoration.none,
            )
          : GoogleFonts.redHatDisplay(
              height: height,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize!.sp, decorationThickness: 4,
              color: color ?? Colors.black,
              // fontFamily: fontFamily??'Red Hat Display',
              // height: 1,
              decoration:
                  underline! ? TextDecoration.underline : TextDecoration.none,
            ),
    );
  }
}
