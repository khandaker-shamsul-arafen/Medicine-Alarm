import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../about/views/about_view.dart';
import '../../add_medicine/views/add_medicine_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../running/views/running_view.dart';

class BottomNavigationBarController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement BottomNavigationBarController

  RxInt currentIndex = 0.obs;
  late TabController? tabController;

  late AnimationController fabAnimationController;
  late AnimationController borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.alarm,
    Icons.person,
    Icons.info_outline,
  ].obs;
  var tabs = [
    const HomeView(),
    const RunningView(),
    const ProfileView(),
    const AboutView(),
    const AddMedicineView(),
  ];

  @override
  void onInit() {
    //tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
