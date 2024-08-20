// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';

class SliderHotelWidget extends StatefulWidget {
  SliderHotelWidget(
      {super.key, required this.autoPlay, this.images, this.isHome});
  final bool autoPlay;
  bool? isHome;
  final List<String>? images;

  @override
  State<SliderHotelWidget> createState() => _SliderHotelWidgetState();
}

class _SliderHotelWidgetState extends State<SliderHotelWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: widget.images!
              .map(
                (e) => Image.asset(
                  e,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: widget.isHome! ? AppHeight.h360 : AppHeight.h342,
            autoPlay: widget.autoPlay,
            padEnds: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, _) {
              currentIndex = index;
              setState(() {});
            },
          ),
        ),
        Container(
          padding: widget.isHome!
              ? EdgeInsets.only(
                  bottom: AppHeight.h13,
                )
              : EdgeInsets.symmetric(
                  horizontal: AppWidth.w20,
                  vertical: AppHeight.h13,
                ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: widget.isHome!
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: widget.images!
                .map((e) => IndicatorCircleWidget(
                      isActive: currentIndex == widget.images!.indexOf(e),
                      activeColor: AppColors.white,
                      inActiveColor: AppColors.grey2,
                      inActiveRadius: AppRadius.r8,
                      activeWidth: AppWidth.w40,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class IndicatorCircleWidget extends StatelessWidget {
  const IndicatorCircleWidget(
      {super.key,
      required this.isActive,
      required this.activeColor,
      required this.inActiveColor,
      required this.activeWidth,
      required this.inActiveRadius});
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final double activeWidth;
  final double inActiveRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppWidth.w3),
      width: isActive ? activeWidth : inActiveRadius,
      height: inActiveRadius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r100),
        color: isActive ? activeColor : inActiveColor,
      ),
    );
  }
}
