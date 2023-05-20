import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

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
              Container(
                height: 110.h,
                width: Get.width,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AllColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "01 : 03 PM",
                      style: AllTextStyle()
                          .textRegularStyle(color: AllColors.primaryColor),
                    ),
                    Text(
                      "01 : 03 PM",
                      style: AllTextStyle()
                          .textRegularStyle20(color: AllColors.primaryColor),
                    ),
                    Text(
                      "Napa 500",
                      style: AllTextStyle().textRegularStyle20(
                          color: AllColors.primaryColor, fontSize: 26),
                    )
                  ],
                ),
              ),
              ConstantWidget().gapeH(16),
              Text(
                'Recent Medicine Time ',
                style: AllTextStyle().textRegularStyle16(
                    color: AllColors.pureBlack.withOpacity(0.6)),
              ),
              ConstantWidget().gapeH8(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeCard(
                        time: '12:03',
                        mediceneName: 'Napa',
                        color: AllColors.primaryColor,
                      );
                    }),
              ),
              ConstantWidget().gapeH(16),
              Text(
                'Recently Ended ',
                style: AllTextStyle().textRegularStyle16(
                    color: AllColors.pureBlack.withOpacity(0.6)),
              ),
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
