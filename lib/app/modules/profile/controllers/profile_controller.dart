import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../../../helper/base64_helper.dart';
import '../../../helper/sql_helper.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  RxBool nameValidate = false.obs;
  RxList allData = [].obs;
  RxString profilePhotoBase64 = ''.obs;

  late Database database;

  @override
  void onInit() async {
    database = await SqlHelper.databaseCreate();
    SqlHelper.createTables(database);

    refreshItems();

    super.onInit();
  }

  pickImageFromGallery() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
      profilePhotoBase64.value =
          Utility.base64String(await imgFile!.readAsBytes());
    });
  }

  Uint8List loadImage() {
    return Utility.dataFromBase64String(profilePhotoBase64.value);
  }

  refreshItems() async {
    final data = await SqlHelper.getProfileInfo(database);
    allData.value = data;
    name.text = allData[0]['full_name'];
    email.text = allData[0]['email'];
    phone.text = allData[0]['phone'];
    address.text = allData[0]['address'];
    profilePhotoBase64.value = allData[0]['image'];
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
