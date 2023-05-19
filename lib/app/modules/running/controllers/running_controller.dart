import 'package:get/get.dart';

class RunningController extends GetxController {
  //TODO: Implement RunningController
  final isSelectWeekDay = [1, 1, 1, 1, 1, 1, 1].obs;

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
