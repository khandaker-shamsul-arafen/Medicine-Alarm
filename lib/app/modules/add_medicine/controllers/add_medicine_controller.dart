import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  //TODO: Implement AddMedicineController
  TextEditingController textController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  RxString pickedDate = ''.obs;

  RxList time = [].obs;

  final count = 0.0.obs;

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
