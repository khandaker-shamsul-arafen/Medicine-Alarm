import 'package:get/get.dart';
import 'package:medicine_alarm/app/modules/add_medicine/bindings/add_medicine_binding.dart';
import 'package:medicine_alarm/app/modules/home/bindings/home_binding.dart';
import 'package:medicine_alarm/app/modules/profile/bindings/profile_binding.dart';
import 'package:medicine_alarm/app/modules/running/bindings/running_binding.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
      () => BottomNavigationBarController(),
    );
    AddMedicineBinding().dependencies();
    HomeBinding().dependencies();
    RunningBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
