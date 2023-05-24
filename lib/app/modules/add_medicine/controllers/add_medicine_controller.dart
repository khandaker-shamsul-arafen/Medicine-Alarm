import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  //TODO: Implement AddMedicineController
  TextEditingController textController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Time time1 = Time(hour: 11, minute: 30);
  RxString pickedDate = ''.obs;
  final isSelectWeekDay = [1, 1, 1, 1, 1, 1, 1].obs;
  RxList weekName = [
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ].obs;

  RxList time = ['17', '20', '47'].obs;
  RxList time2 = ['59', '12', '15'].obs;
  RxList dayTime = ['17', '20', '47'].obs;

  final count = 0.0.obs;

  void onTimeChanged(Time newTime) {
    time1 = newTime;
    print('Shanto ' + newTime.period.toString());
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
