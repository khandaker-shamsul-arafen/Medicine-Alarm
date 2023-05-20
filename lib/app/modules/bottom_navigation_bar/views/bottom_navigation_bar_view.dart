import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        //destination screen

        body: controller.tabs[controller.currentIndex.value],

        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: FloatingActionButton(
            backgroundColor: AllColors.primaryColor,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              size: 33,
              color: AllColors.pureWhite,
            ),
            onPressed: () {
              controller.currentIndex.value = 4;
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: controller.iconList.value,
          iconSize: 33,

          activeIndex: controller.currentIndex.value,
          height: 80.h,
          activeColor: AllColors.pureWhite,
          inactiveColor: AllColors.pureWhite.withOpacity(0.7),
          backgroundColor: AllColors.primaryColor,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          //other params
        ),
      );
    });
  }
}
