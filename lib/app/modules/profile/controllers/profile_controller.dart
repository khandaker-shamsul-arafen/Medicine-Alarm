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
  final emailKey = GlobalKey<FormState>();
  RxBool nameValidate = true.obs;
  RxBool emailValidate = true.obs;
  RxList profileData = [].obs;
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
    profileData.value = data;
    name.text = profileData[0]['full_name'];
    email.text = profileData[0]['email'];
    phone.text = profileData[0]['phone'];
    address.text = profileData[0]['address'];
    profilePhotoBase64.value = profileData[0]['image'];
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
