// ignore_for_file: unnecessary_null_comparison

import 'dart:math';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:bot_toast/bot_toast.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Common {
  static String truncateHtml(String html, int maxChars) {
    dom.Document document = html_parser.parse(html);
    dom.Element? bodyElement = document.body;
    if (bodyElement != null) {
      StringBuffer truncatedHtmlBuffer = StringBuffer();
      int charCount = 0;

      for (var element in bodyElement.children) {
        if (charCount >= maxChars) break;

        String elementHtml = element.outerHtml;
        String elementText = element.text;

        if (charCount + elementText.length <= maxChars) {
          truncatedHtmlBuffer.write(elementHtml);
          charCount += elementText.length;
        } else {
          int remainingChars = maxChars - charCount;
          String truncatedText = elementText.substring(0, remainingChars);
          String truncatedElementHtml =
              elementHtml.replaceFirst(elementText, truncatedText);
          truncatedHtmlBuffer.write(truncatedElementHtml);
          charCount += remainingChars;
        }
      }

      return truncatedHtmlBuffer.toString();
    }

    return html; // Fallback in case parsing fails
  }


  static showNotoficationDialog(
    String title,
    String message,
    Color color,
  ) {
    BotToast.showNotification(
      backgroundColor: color,
      title: (_) => CustomText(
        message,
        color: Colors.white,
        fontSize: 15,
      ),
      // subtitle: (_) => CustomText(
      //   message,
      //   color: Colors.white,
      //   fontSize: 15.sp,
      // ),
    );
  }

  static List<SvgPicture> getStarsList(double rate, {double size = 18}) {
    var list = <SvgPicture>[];
    list = List.generate(rate.floor(), (index) {
      return SvgPicture.asset(ImageAssetsSvgs.starSvg);
    });
    // if (rate - rate.floor() > 0) {
    //   list.add(
    //       Icon(Icons.star_half, size: size, color: const Color(0xFFF3603F)));
    // }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return SvgPicture.asset(ImageAssetsSvgs.starSolidSvg);
    }));
    return list;
  }

  static notFoundWidget(String title) {
    return Column(
      children: [
        SizedBox(
          height: AppHeight.h100,
        ),
        // Center(
        //   child: SvgPicture.asset(
        //     ImageAssetsSvgs.notFoundSvg,
        //   ),
        // ),
        SizedBox(
          height: AppHeight.h40,
        ),
        Center(
          child: CustomText(
            title,
            fontSize: 24,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        )
      ],
    );
  }

  static String limitString(String text, int limit) {
    return text.toString().substring(0, min<int>(limit, text.length)) +
        (text.length > limit ? "..." : '');
  }

  static double childAspectRatio(double ratio) {
    return MediaQuery.of(Get.context!).size.width /
        (MediaQuery.of(Get.context!).size.height / ratio);
  }
}
