import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

class AddTimeCard extends StatelessWidget {
  final String time;

  const AddTimeCard({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: AllColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Text(
        '$time PM',
        style: AllTextStyle().textRegularStyle(color: AllColors.pureWhite),
      )),
    );
  }
}
