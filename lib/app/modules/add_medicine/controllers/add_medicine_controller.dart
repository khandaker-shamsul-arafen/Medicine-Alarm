import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  //TODO: Implement AddMedicineController
  TextEditingController textController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Time time1 = Time(hour: 11, minute: 30);
  RxString pickedDate = ''.obs;

  RxList time = [].obs;

  final count = 0.0.obs;

  void onTimeChanged(Time newTime) {
    time1 = newTime;
  }

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
