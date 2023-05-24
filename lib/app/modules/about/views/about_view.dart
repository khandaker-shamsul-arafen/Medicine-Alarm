import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

import '../../../widget/bullet_text.dart';
import '../../../widget/ofice_details.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AboutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('About HRsoftBd'),
          //  backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 16.0.h, left: 16.0.w, right: 16.0.w),
          child: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 90.h,
                      width: 150.w,
                      // color: Colors.amber,
                      child: Image.asset(
                        'assets/hrsoftbd-logo.png',
                      ),
                    ),
                  ),
                  //  ConstantWidget().gapeH16(),
                  Card(
                    //color: AllColors.greyLight,
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            "Who we are",
                            style:
                                AllTextStyle().textRegularStyle16(fontSize: 24),
                          )),
                          ConstantWidget().gapeH8(),
                          Text(
                            'HRsoftBD is your one stop solution for all your IT requirements. We are a team of highly qualified specialists dedicated to provide state of the art software solutions that will definitely meet your requirements.\nOur passionate, creative and well experienced team has provided a wide variety of tailored software solutions to 13000 clients in a span since 2013.\nOur development team is full of enthusiastic professionals who will always exceed your expectations.\nHRsoftBD is a certified technology company registered in Bangladesh and we are always at your service.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              //  height: 1.55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstantWidget().gapeH16(),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.0.w,
                          right: 12.0.w,
                          top: 12.0.h,
                          bottom: 0.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Our Services",
                              style: AllTextStyle()
                                  .textRegularStyle16(fontSize: 24),
                            ),
                          ),
                          ConstantWidget().gapeH8(),
                          SizedBox(
                            height: Get.height * 0.50,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return BulletText(
                                  text: controller.items[index].txt,
                                );
                              },
                            ),
                          ),
                          //  Text('\u2022 Bullet Text'),
                        ],
                      ),
                    ),
                  ),
                  ConstantWidget().gapeH16(),
                  const OfficeDetails(),
                  ConstantWidget().gapeH(100.h),
                ],
              ),
            ),
          ),
        ));
  }
}
