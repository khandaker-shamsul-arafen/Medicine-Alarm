import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constant_widget.dart';
import '../../../constants/text_style.dart';
import '../../../widget/active_alarm_card.dart';
import '../controllers/inactive_alarm_controller.dart';

class InactiveAlarmView extends GetView<InactiveAlarmController> {
  const InactiveAlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InactiveAlarmView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'InActive Alarm',
              style: AllTextStyle()
                  .textRegularStyle16(fontWeight: FontWeight.w600),
            ),
            ConstantWidget().gapeH16(),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ActiveAlarmCard(
                            inActive: true,
                            isSelectDay: controller.isSelectWeekDay),
                        ConstantWidget().gapeH8()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
