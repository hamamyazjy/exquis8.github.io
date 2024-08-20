import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.actions, this.title}) : super(key: key);
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppHeight.h100,
      actions: actions,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(ImageAssetsSvgs.arrowLeftSvg),
        onPressed: () => Get.back(),
        color: AppColors.black,
      ),
      title: Row(
        children: [
          CustomText(
            title ?? '',
            color: AppColors.indicatorColor,
            fontSize: 16,
            fontWeight: AppFontWeight.bold,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.h100);
}
