// ignore_for_file: use_key_in_widget_constructors

import 'package:exquis8_hotel_app/app/components/custom_button.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Controllers/Authentication_controller.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class BoardingPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/mp4/onboarding.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh the UI when the video is initialized
        _controller.play();
      });
    // Add listener to handle the video completion
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero); // Seek to the start
        _controller.play(); // Play the video again
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController =
        Get.put<AuthenticationController>(AuthenticationController());
    return Scaffold(
      body: Center(
        child: Container(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                // Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       end: Alignment(6.123234262925839e-17, 1),
                //       begin: Alignment(-1, 6.123234262925839e-17),
                //       colors: [
                //         Color.fromRGBO(58, 58, 58, 0),
                //         Color.fromRGBO(43, 43, 43, 1)
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  width: Get.width,
                  height: Get.height,
                  child: _controller.value.isInitialized
                      ? VideoPlayer(_controller)
                      : Center(child: CircularProgressIndicator()),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(flex: 7),
                    // Center(
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     decoration: const BoxDecoration(),
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 0, vertical: 0),
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: <Widget>[
                    //         CustomText(
                    //           'Welcome to 👋',
                    //           color: AppColors.white,
                    //           fontSize: 42,
                    //           fontWeight: FontWeight.normal,
                    //           fontFamily: 'Urbanist',
                    //         ),
                    //         // SizedBox(height: AppHeight.h10),
                    //         CustomText(
                    //           'Swissotel The Bosphorus',
                    //           textAlign: TextAlign.center,
                    //           color: AppColors.white,
                    //           fontSize: 42,
                    //           fontWeight: FontWeight.normal,
                    //           fontFamily: 'Urbanist',
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const Spacer(flex: 5),
                    Center(
                      child: CustomButton(
                        width: AppWidth.w327,
                        height: AppHeight.h48,
                        onTap: () {
                          // Get.offAllNamed(AppRoutes.logInPage);
                          authenticationController.authByRoom();
                        },
                        title: 'Continue',
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h32,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
