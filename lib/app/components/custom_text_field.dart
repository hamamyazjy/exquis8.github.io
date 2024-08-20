// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:exquis8_hotel_app/utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? topTitle;
  final Widget? topIcon;

  final Function? onSaved;
  final Icon? iconData;
  final int? maxLine;
  final int horizontalPadding;
  final TextInputType? textInputType;
  final Color? fillColor;
  final String? textInitialValue;
  TextEditingController? textEditingController;
  final bool? confirmPass;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? password;
  final Function? validator;
  final bool? autofocus;
  final bool? enable;
  final TextAlign? textAlign;

  CustomTextFormField(
      {Key? key,
      this.hintText,
      this.onSaved,
      this.topIcon,
      this.iconData,
      this.horizontalPadding = 10,
      this.textInputType,
      this.textEditingController,
      this.textInitialValue,
      this.suffixIcon,
      this.maxLine = 1,
      this.autofocus = false,
      this.textAlign,
      this.password = false,
      this.enable = true,
      this.fillColor,
      this.prefixIcon,
      this.validator,
      this.confirmPass = false,
      this.topTitle});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  IconData iconData = FontAwesomeIcons.eyeSlash;
  bool toggleEye = true;
  bool taped = false;
  FocusNode focusNode = FocusNode();
  Function? validator;

  fmToggleEye() {
    toggleEye = !toggleEye;
    iconData = toggleEye ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
    setState(() {});
  }

  @override
  void initState() {
    focusNode.addListener(() {
      taped = focusNode.hasFocus;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textInputType == TextInputType.name) {
      validator = Validators.validationNull;
    } else if (widget.textInputType == TextInputType.phone) {
      validator = Validators.validationMobile;
    } else if (widget.textInputType == TextInputType.number) {
      validator = Validators.validationMobile;
    } else if (widget.textInputType == TextInputType.url) {
      validator = Validators.isLinkUrl;
    } else if (widget.textInputType == TextInputType.emailAddress) {
      validator = Validators.isEmail;
    } else {
      validator = Validators.validationNull;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.topIcon == null
            ? CustomText(
                widget.topTitle,
                fontSize: 12,
                fontWeight: AppFontWeight.medium,
              )
            : Row(
                children: [
                  widget.topIcon!,
                  SizedBox(
                    width: 7.w,
                  ),
                  CustomText(
                    widget.topTitle,
                    fontSize: 12,
                    fontWeight: AppFontWeight.medium,
                  )
                ],
              ),
        SizedBox(
          height: AppHeight.h8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r14),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            enabled: widget.enable,
            style: GoogleFonts.redHatDisplay(
              color: AppColors.black,
              fontWeight: AppFontWeight.regularOrNormal,
            ),
            initialValue: widget.textInitialValue,
            controller: widget.textEditingController,
            autofocus: widget.autofocus!,
            maxLines: widget.maxLine!,
            textAlign: widget.textAlign ?? TextAlign.start,
            validator: (value) => widget.confirmPass!
                ? widget.validator!(value)
                : validator!(value),
            onSaved: (newValue) => widget.onSaved!(newValue),
            onChanged: (value) {
              widget.onSaved!(value);
            },
            obscureText: widget.password! ? toggleEye : false,
            cursorColor: Colors.grey,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.fromLTRB(0.w, 10.h, 20.w, 10.h),
              isDense: true,

              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              suffix: widget.password!
                  ? GestureDetector(
                      child: Icon(
                        iconData,
                        size: 20.r,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      onTap: () {
                        fmToggleEye();
                      },
                    )
                  : null,
              hintText: widget.hintText!.tr,
              hintStyle: GoogleFonts.redHatDisplay(
                color: AppColors.grey2,
                fontWeight: AppFontWeight.regularOrNormal,
              ),

              fillColor: Colors.transparent,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Color(0xffB8B8B8),
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Color(0xffB8B8B8),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Color(0xffB8B8B8),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Color(0xffB8B8B8),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.redAccent,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r14),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
