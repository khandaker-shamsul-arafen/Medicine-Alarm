import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:validatorless/validatorless.dart';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pickImageFromGallery();
                  },
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundImage: MemoryImage(controller.loadImage()),
                  ),
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full Name",
                    // border: const OutlineInputBorder(),
                    // errorText: (controller.name.text.isEmpty)
                    //     ? controller.nameValidate.value
                    //         ? 'Name Can\'t Be Empty'
                    //         : null
                    //     : null,
                  ),
                  keyboardType: TextInputType.name,
                ),
                ConstantWidget().gapeH16(),
                TextFormField(
                  controller: controller.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validatorless.multiple([
                    Validatorless.min(11, 'phone must be  11 characters'),
                    Validatorless.max(11, 'phone must be  11 characters'),
                  ]),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone",
                  ),
                  keyboardType: TextInputType.phone,
                ),
                ConstantWidget().gapeH16(),
                Form(
                  key: controller.emailKey,
                  child: TextFormField(
                    controller: controller.email,
                    autocorrect: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || !validator.email(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                ConstantWidget().gapeH16(),
                TextField(
                  controller: controller.address,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: "Address",
                    border: OutlineInputBorder(
                        //  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                        ),
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
                ConstantWidget().gapeH16(),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.emailKey.currentState!.validate()) {
                      SqlHelper.updateItem(
                          controller.database,
                          controller.name.text,
                          controller.phone.text,
                          controller.email.text,
                          controller.address.text,
                          controller.profilePhotoBase64.value);
                    }

                    // controller.loadImage();
                  },
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
            );
          }),
        ),
      ),
    );
  }
}
