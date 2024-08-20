// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CachedNetworkImageShare extends StatelessWidget {
  final String? urlImage;
  final double? widthNumber;
  final double? heigthNumber;
  final double? borderNumber;
  final BoxFit? boxFit;

  CachedNetworkImageShare({
    this.urlImage,
    this.heigthNumber,
    this.widthNumber,
    this.borderNumber,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    log('urlImage $urlImage');
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderNumber!.r),
      child: CachedNetworkImage(
        imageUrl: urlImage!,
        httpHeaders: const {
          'Cookie':
              'tz=Asia/Gaza; frontend_lang=en_US; session_id=d0129fa6e1baebf9de760dd35d426fbb4014b556; cids=1==; session_id=4d75098abf09627396be9d84c9a1a7d815000ccb'
        },
        imageBuilder: (context, imageProvider) => Container(
          width: widthNumber!,
          height: heigthNumber!,
          decoration: BoxDecoration(
            shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => ClipRRect(
          borderRadius: BorderRadius.circular(borderNumber!.r),
          child: SkeletonAnimation(
            borderRadius: BorderRadius.circular(borderNumber!.r),
            shimmerColor: Colors.white.withOpacity(0.7),
            child: Container(
              width: widthNumber!,
              height: heigthNumber!,
              decoration: BoxDecoration(
                shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: widthNumber!,
          height: heigthNumber!,
          decoration: BoxDecoration(
            shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
