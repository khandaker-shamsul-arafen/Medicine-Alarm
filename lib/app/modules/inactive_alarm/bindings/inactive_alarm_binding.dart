import 'package:get/get.dart';

import '../controllers/inactive_alarm_controller.dart';

class InactiveAlarmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InactiveAlarmController>(
      () => InactiveAlarmController(),
    );
  }
}
