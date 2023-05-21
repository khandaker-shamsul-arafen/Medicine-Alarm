import 'package:get/get.dart';

class InactiveAlarmController extends GetxController {
  //TODO: Implement InactiveAlarmController
  final isSelectWeekDay = [1, 1, 0, 0, 1, 0, 1].obs;
  final count = 0.obs;

  @override
  void onInit() {
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

  void increment() => count.value++;
}
