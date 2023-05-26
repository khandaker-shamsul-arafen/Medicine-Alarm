import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/sql_helper.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  RxBool validate = false.obs;
  RxBool isLoading = true.obs;
  RxList allData = [].obs;

  final count = 0.obs;

  @override
  void onInit() {
    SqlHelper.db1();
    //SqlHelper.deletedb();
    super.onInit();
  }

  getItems() async {
    final data = await SqlHelper.getItems1();
    allData.value = data;
    print(allData[0]['full_name']);
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
