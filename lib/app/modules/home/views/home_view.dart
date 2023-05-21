import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/home_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w, right: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstantWidget().gapeH16(),
              Center(
                child: Text(
                  'Next Medicine Taking time ',
                  style: AllTextStyle().textRegularStyle16(
                      color: AllColors.pureBlack.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              ConstantWidget().gapeH16(),
              SizedBox(
                height: 120.h,
                width: Get.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  surfaceTintColor: AllColors.greyWhite.withOpacity(1.0),
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstantWidget().gapeH(9),
                      Text(
                        "01 min : 03 sec",
                        style: AllTextStyle().textRegularStyle(
                            color: AllColors.grey, fontWeight: FontWeight.bold),
                      ),
                      ConstantWidget().gapeH(1),
                      Text(
                        "01:03 PM",
                        style: AllTextStyle().textRegularStyle20(
                            color: AllColors.primaryColor, fontSize: 28),
                      ),
                      ConstantWidget().gapeH(0),
                      Text(
                        "Napa 500",
                        style: AllTextStyle().textRegularStyle(
                            color: AllColors.grey, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              ConstantWidget().gapeH16(),
              Center(
                child: Text(
                  'Recent Medicine ',
                  style: AllTextStyle().textRegularStyle16(
                      color: AllColors.pureBlack.withOpacity(0.6)),
                ),
              ),
              ConstantWidget().gapeH16(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return const HomeCard(
                              time: '12:03',
                              mediceneName: 'Napa 200mg Pantonix 200mg',
                            );
                          }),
                    ),
                  ],
                ),
              ),

              ConstantWidget().gapeH(20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return const HomeCard(
                              time: '12:03',
                              mediceneName: 'Pantonix 200mg',
                            );
                          }),
                    ),
                  ],
                ),
              ),
              ConstantWidget().gapeH(20),
              Center(
                child: SizedBox(
                  height: 50.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.INACTIVE_ALARM);
                    },
                    icon: Image.asset('assets/Alarm.png'),
                    label: Text(
                      'Recently Ended Medicine Schedule',
                      style: AllTextStyle()
                          .textRegularStyle(color: AllColors.pureWhite),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AllColors.primaryColor.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              )

              // ConstantWidget().gapeH8(),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.27,
              //   child: ListView.builder(
              //       itemCount: 15,
              //       shrinkWrap: true,
              //       physics: const BouncingScrollPhysics(),
              //       itemBuilder: (BuildContext context, int index) {
              //         return const HomeCard(
              //             time: '12:03', mediceneName: 'Histasin');
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
