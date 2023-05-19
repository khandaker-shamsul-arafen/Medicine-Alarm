import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

class WeeklyButton extends StatefulWidget {
  final List isSelecDay;
  final int index;
  final String dayName;
  final String dayTime;

  const WeeklyButton(
      {Key? key,
      required this.dayName,
      required this.dayTime,
      required this.index,
      required this.isSelecDay})
      : super(key: key);

  @override
  State<WeeklyButton> createState() => _WeeklyButtonState();
}

class _WeeklyButtonState extends State<WeeklyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelecDay[widget.index] =
              0; //running Controller Ar IsSelected  List a Add korte Hobe 0 k.

          // for (var index1 = 0; index1 <widget.isSelecDay.length; index1++) {
          //   if (index1 != widget.index) {
          //     widget.isSelecDay[index1] = 0;
          //   }
          // }
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 4.0.w),
        child: Column(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: (widget.isSelecDay[widget.index] == 1)
                      ? AllColors.primaryColor
                      : AllColors.grey,
                  shape: BoxShape.circle),
              child: Center(
                  child: Text(widget.dayName,
                      style: AllTextStyle()
                          .textRegularStyle(color: AllColors.pureWhite))),
            ),
            ConstantWidget().gapeH16(),
            Text(
              widget.dayTime,
              style: AllTextStyle()
                  .textRegularStyle(color: AllColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
