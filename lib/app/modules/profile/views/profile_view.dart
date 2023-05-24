import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

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
        child: Obx(() {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 100.r,
                    backgroundImage: const NetworkImage(
                        'https://www.pinclipart.com/picdir/big/218-2189254_free-online-avatars-kid-characters-family-vector-for.png'),
                    onBackgroundImageError: (e, s) {
                      debugPrint('image issue, $e,$s');
                    }),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Full Name",
                    border: const OutlineInputBorder(),
                    errorText: (controller.name.text.isEmpty)
                        ? controller.validate.value
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
                        ? controller.validate.value
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
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide:
                    //       const BorderSide(color: Colors.blueGrey, width: 2),
                    // ),
                    errorText: (controller.email.text.isEmpty)
                        ? controller.validate.value
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
                        ? controller.validate.value
                            ? 'Age Can\'t Be Empty'
                            : null
                        : null,
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
                ConstantWidget().gapeH16(),
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.primaryColor.withOpacity(0.8),
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
          );
        }),
      ),
    );
  }
}
