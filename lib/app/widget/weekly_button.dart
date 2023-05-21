import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

class WeeklyButton extends StatefulWidget {
  final List isSelecDay;
  final int index;
  final String dayName;
  final bool inactiveText;

  const WeeklyButton(
      {Key? key,
      required this.dayName,
      required this.index,
      required this.isSelecDay,
      required this.inactiveText})
      : super(key: key);

  @override
  State<WeeklyButton> createState() => _WeeklyButtonState();
}

class _WeeklyButtonState extends State<WeeklyButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (widget.isSelecDay[widget.index] == 0) {
                widget.isSelecDay[widget.index] = 1;
              } else if (widget.isSelecDay[widget.index] == 1) {
                widget.isSelecDay[widget.index] = 0;
              } //running Controller Ar IsSelected  List a Add korte Hobe 0 k.

              // for (var index1 = 0; index1 <widget.isSelecDay.length; index1++) {
              //   if (index1 != widget.index) {
              //     widget.isSelecDay[index1] = 0;
              //   }
              // }
            });
          },
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
                color: (widget.isSelecDay[widget.index] == 1)
                    ? (widget.inactiveText)
                        ? Colors.green[500]
                        : AllColors.primaryColor
                    : AllColors.grey,
                shape: BoxShape.circle),
            child: Center(
                child: Text(widget.dayName,
                    style: AllTextStyle().textRegularStyle(
                        color: AllColors.pureWhite, fontSize: 12))),
          ),
        ),
        ConstantWidget().gapeW8(),
      ],
    );
  }
}
