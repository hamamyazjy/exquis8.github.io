// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:exquis8_hotel_app/app/components/cash_network_image_share.dart';
import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Controllers/profile_controller.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PersonalInformationPage extends StatefulWidget {
  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  String? dobDate;

  String? dobSendDate;

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();

    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(
          title: 'Personal Information',
        ),
        body: Obx(
          () => ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: Container(
                      width: AppWidth.w100,
                      height: AppHeight.h100,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CachedNetworkImageShare(
                        urlImage: profileController.accountData['image_url']
                            .toString(),
                        widthNumber: AppWidth.w100,
                        heigthNumber: AppHeight.h100,
                        borderNumber: 0,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   right: 155,
                  //   bottom: -5,
                  //   child: Container(
                  //     width: AppWidth.w40,
                  //     height: AppHeight.h40,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.btnColor,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Center(
                  //       child: SvgPicture.asset(
                  //         ImageAssetsSvgs.cameraSvg,
                  //       ),
                  //     ),
                  //   ),
                  // )
               
                ],
              ),
              SizedBox(
                height: AppHeight.h24,
              ),
              const Divider(
                color: Color.fromRGBO(229, 231, 235, 1),
                thickness: 1,
              ),
              SizedBox(
                height: AppHeight.h24,
              ),
              Center(
                child: SizedBox(
                  width: AppWidth.w328,
                  child: CustomTextFormField(
                    enable: false,
                    hintText: 'Full name',
                    onSaved: (c) {},
                    textEditingController: nameController.text.isEmpty
                        ? TextEditingController(
                            text: profileController.accountData['name']
                                .toString())
                        : nameController,
                    topTitle: 'Full name',
                  ),
                ),
              ),
              // SizedBox(
              //   height: AppHeight.h20,
              // ),
              // Center(
              //   child: SizedBox(
              //     width: AppWidth.w328,
              //     child: CustomTextFormField(
              //       hintText: 'Yazji',
              //       textInitialValue: 'Yazji',
              //       topTitle: 'Last name',
              //     ),
              //   ),
              // ),
              SizedBox(
                height: AppHeight.h20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                child: CustomText(
                  'Gender',
                  fontSize: 12,
                  color: AppColors.indicatorColor,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 0,
                      activeColor: AppColors.btnColor,
                      title: CustomText(
                        'Male',
                        color: AppColors.indicatorColor,
                        fontSize: 14,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                      groupValue: profileController.genderGroup.value,
                      onChanged: (value) {
                        // profileController.genderGroup.value = 0;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 1,
                      activeColor: AppColors.btnColor,
                      title: CustomText(
                        'Female',
                        color: AppColors.indicatorColor,
                        fontSize: 14,
                        fontWeight: AppFontWeight.regularOrNormal,
                      ),
                      groupValue: profileController.genderGroup.value,
                      onChanged: (value) {
                        // profileController.genderGroup.value = 1;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppHeight.h20,
              ),
              Center(
                child: SizedBox(
                  width: AppWidth.w328,
                  child: GestureDetector(
                    onTap: () {
                      // showDialog(
                      //   useRootNavigator: false,
                      //   context: context,
                      //   builder: (c) => CustomDateCalender(
                      //     (String dateShow, String dateSend) {
                      //       dobDate = dateShow;
                      //       dobSendDate = dateSend;

                      //       setState(() {});
                      //     },
                      //   ),
                      // );
                    },
                    child: CustomTextFormField(
                      hintText: 'Date of birth',
                      textEditingController: TextEditingController(
                          text: dobDate ??
                              profileController.accountData['dob'].toString()),
                      enable: false,
                      topTitle: 'Date of birth',
                      suffixIcon: SizedBox(
                        width: AppWidth.w20,
                        height: AppHeight.h20,
                        child: Center(
                          child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.h38,
              ),
              const Divider(
                color: Color.fromRGBO(229, 231, 235, 1),
                thickness: 1,
              ),
              SizedBox(
                height: AppHeight.h20,
              ),
              Center(
                child: SizedBox(
                  width: AppWidth.w328,
                  child: CustomTextFormField(
                    enable: false,
                    hintText: 'Email',
                    onSaved: (c) {},
                    textEditingController: emailController.text.isEmpty
                        ? TextEditingController(
                            text: profileController.accountData['email']
                                .toString())
                        : emailController,
                    topTitle: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.h20,
              ),
              Center(
                child: SizedBox(
                  width: AppWidth.w328,
                  child: CustomTextFormField(
                    enable: false,
                    hintText: 'Input phone number',
                    topTitle: 'Phone number',
                    onSaved: (c) {},
                    textEditingController: mobileController.text.isEmpty
                        ? TextEditingController(
                            text: profileController.accountData['mobile']
                                .toString())
                        : mobileController,
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.h28,
              ),
              const Divider(
                color: Color.fromRGBO(229, 231, 235, 1),
                thickness: 1,
              ),
              SizedBox(
                height: AppHeight.h18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                child: CustomButton(
                  title: 'Save Changes',
                  height: AppHeight.h48,
                  color: AppColors.grey2,
                  // onTap: () {
                  //   profileController.updateProfile(dobSendDate == null
                  //       ? {
                  //           "name": nameController.text.isEmpty
                  //               ? profileController.accountData['name']
                  //                   .toString()
                  //               : nameController.text,
                  //           "gender": profileController.genderGroup.value == 0
                  //               ? 'm'
                  //               : 'f',
                  //           "mobile": mobileController.text.isEmpty
                  //               ? profileController.accountData['mobile']
                  //                   .toString()
                  //               : mobileController.text,
                  //           "email": emailController.text.isEmpty
                  //               ? profileController.accountData['email']
                  //                   .toString()
                  //               : emailController.text,
                  //           // "image": ''
                  //         }
                  //       : {
                  //           "name": nameController.text.isEmpty
                  //               ? profileController.accountData['name']
                  //                   .toString()
                  //               : nameController.text,
                  //           "gender": profileController.genderGroup.value == 0
                  //               ? 'm'
                  //               : 'f',
                  //           "dob": dobSendDate,
                  //           "mobile": mobileController.text.isEmpty
                  //               ? profileController.accountData['mobile']
                  //                   .toString()
                  //               : mobileController.text,
                  //           "email": emailController.text.isEmpty
                  //               ? profileController.accountData['email']
                  //                   .toString()
                  //               : emailController.text,
                  //           // "image": ''
                  //         });
                  // },
             
                ),
              ),
              SizedBox(
                height: AppHeight.h30,
              ),
            ],
          ),
        ));
  }
}
