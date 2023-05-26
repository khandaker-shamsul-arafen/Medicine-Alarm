import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';

import '../../../constants/text_style.dart';
import '../../../widget/active_alarm_card.dart';
import '../controllers/running_controller.dart';

class RunningView extends GetView<RunningController> {
  const RunningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Alarm',
              style: AllTextStyle()
                  .textRegularStyle16(fontWeight: FontWeight.w600),
            ),
            ConstantWidget().gapeH8(),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h),
                      child: ActiveAlarmCard(
                        isSelectDay: controller.isSelectWeekDay,
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
