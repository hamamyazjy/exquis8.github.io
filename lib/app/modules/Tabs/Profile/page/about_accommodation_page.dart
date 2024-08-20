import 'package:exquis8_hotel_app/app/components/custom_app_bar.dart';
import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/components/custom_text_field.dart';
import 'package:exquis8_hotel_app/app/components/custom_date_picker.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Controllers/profile_controller.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutAccommodationPage extends StatefulWidget {
  const AboutAccommodationPage({super.key});

  @override
  State<AboutAccommodationPage> createState() => _AboutAccommodationPageState();
}

class _AboutAccommodationPageState extends State<AboutAccommodationPage> {
  String? checkInDate;
  String? checkInSendDate;
  String? checkOutDate;
  String? checkOutSendDate;
  String? dobDate;
  String? dobSendDate;

  TextEditingController idNumberController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: 'About Accommodation',
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w24, vertical: AppHeight.h40),
          child: CustomButton(
            height: AppHeight.h48,
            title: 'Save Changes',
            onTap: () {
              profileController.addAccommodation({
                "check_in": checkInSendDate,
                "check_out": checkOutSendDate,
                "dob": dobSendDate,
                "id_number": idNumberController.text,
                "room_number": roomNumberController.text
              });
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: AppHeight.h32,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  useRootNavigator: false,
                  context: context,
                  builder: (c) => CustomDateCalender(
                    (String dateShow, String dateSend) {
                      checkInDate = dateShow;
                      checkInSendDate = dateSend;
                      setState(() {});
                    },
                  ),
                );
              },
              child: CustomTextFormField(
                hintText: 'Check-in Date',
                textEditingController: TextEditingController(text: checkInDate),
                enable: false,
                topTitle: 'Check-in Date',
                suffixIcon: SizedBox(
                  width: AppWidth.w20,
                  height: AppHeight.h20,
                  child: Center(
                    child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  useRootNavigator: false,
                  context: context,
                  builder: (c) => CustomDateCalender(
                    (String dateShow, String dateSend) {
                      checkOutDate = dateShow;

                      checkOutSendDate = dateSend;
                      setState(() {});
                    },
                  ),
                );
              },
              child: CustomTextFormField(
                hintText: 'Check-out Date',
                textEditingController:
                    TextEditingController(text: checkOutDate),
                enable: false,
                topTitle: 'Check-out Date',
                suffixIcon: SizedBox(
                  width: AppWidth.w20,
                  height: AppHeight.h20,
                  child: Center(
                    child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  useRootNavigator: false,
                  context: context,
                  builder: (c) => CustomDateCalender(
                    (String dateShow, String dateSend) {
                      dobDate = dateShow;
                      dobSendDate = dateSend;

                      setState(() {});
                    },
                  ),
                );
              },
              child: CustomTextFormField(
                hintText: 'Date of birth',
                topTitle: 'Date of birth',
                textEditingController: TextEditingController(text: dobDate),
                enable: false,
                suffixIcon: SizedBox(
                  width: AppWidth.w20,
                  height: AppHeight.h20,
                  child: Center(
                    child: SvgPicture.asset(ImageAssetsSvgs.calenderSvg),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h20,
            ),
            CustomTextFormField(
              hintText: 'ID No/Passport No',
              topTitle: 'ID No/Passport No',
              textEditingController: idNumberController,
              onSaved: (c) {},
              suffixIcon: SizedBox(
                width: AppWidth.w20,
                height: AppHeight.h20,
                child: Center(
                  child: SvgPicture.asset(ImageAssetsSvgs.infoSvg),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h20,
            ),
            CustomTextFormField(
              hintText: 'Room number',
              textEditingController: roomNumberController,
              topTitle: 'Room number',
              onSaved: (c) {},
              suffixIcon: SizedBox(
                width: AppWidth.w20,
                height: AppHeight.h20,
                child: Center(
                  child: SvgPicture.asset(ImageAssetsSvgs.infoSvg),
                ),
              ),
            ),
            SizedBox(
              height: AppHeight.h30,
            ),
          ],
        ),
      ),
    );
  }
}
