import 'package:exquis8_hotel_app/app/components/bottom_nav_home.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/page/hotel_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Main/Controllers/main_controller.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/page/profile_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/page/services_page.dart';
import 'package:exquis8_hotel_app/config/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: AppHeight.h50,
              ),
              Expanded(
                child: GetBuilder<MainController>(
                  id: "indexScreen",
                  init: MainController(),
                  builder: (controller) {
                    return [
                      HotelPage(),
                      ServicesPage(),
                      Container(),
                      ProfilePage(),
                    ][controller.indexScreen];
                  },
                ),
              )
            ],
          ),
        
          BottomNavHome(),
        ],
      ),
    );
  }
}
