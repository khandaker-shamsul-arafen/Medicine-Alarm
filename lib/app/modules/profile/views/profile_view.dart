import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

import '../../../helper/sql_helper.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            return Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pickImageFromGallery();
                  },
                  // child: CircleAvatar(
                  //     radius: 100.r,
                  //     backgroundImage: controller.loadImage();
                  //     onBackgroundImageError: (e, s) {
                  //       debugPrint('image issue, $e,$s');
                  //     }),
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundImage: MemoryImage(controller.loadImage()),
                  ),
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Full Name",
                    border: const OutlineInputBorder(),
                    errorText: (controller.name.text.isEmpty)
                        ? controller.nameValidate.value
                            ? 'Name Can\'t Be Empty'
                            : null
                        : null,
                  ),
                  keyboardType: TextInputType.name,
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Phone",
                    border: const OutlineInputBorder(),
                    errorText: (controller.phone.text.isEmpty)
                        ? controller.nameValidate.value
                            ? 'Phone Number Can\'t Be Empty'
                            : null
                        : null,
                  ),
                  keyboardType: TextInputType.phone,
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    errorText: (controller.email.text.isEmpty)
                        ? controller.nameValidate.value
                            ? 'Age Can\'t Be Empty'
                            : null
                        : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.address,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    labelText: "Address",
                    border: const OutlineInputBorder(
                        //  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                        ),
                    errorText: (controller.email.text.isEmpty)
                        ? controller.nameValidate.value
                            ? 'Age Can\'t Be Empty'
                            : null
                        : null,
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
                ConstantWidget().gapeH16(),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // SqlHelper.db();
                        SqlHelper.databaseCreate();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Create",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // SqlHelper.createItem();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Insert",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        SqlHelper.updateItem(
                            controller.database,
                            controller.name.text,
                            controller.phone.text,
                            controller.email.text,
                            controller.address.text,
                            controller.profilePhotoBase64.value);
                        // controller.loadImage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Update",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // SqlHelper.db();
                        //   controller.getItems();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "GEt",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // SqlHelper.db();
                        SqlHelper.deletedb();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Delete",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // SqlHelper.db();
                        SqlHelper.deletedb();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AllColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Delete",
                        style: AllTextStyle()
                            .textRegularStyle16(color: AllColors.pureWhite),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
