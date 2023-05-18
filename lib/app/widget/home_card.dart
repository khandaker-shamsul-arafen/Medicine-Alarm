import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';

import '../constants/all_color.dart';
import '../constants/text_style.dart';

class HomeCard extends StatefulWidget {
  final String time;
  final String mediceneName;
  final Color color;

  const HomeCard({
    Key? key,
    this.color = Colors.grey,
    required this.time,
    required this.mediceneName,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
      color: AllColors.grey2.withOpacity(0.9),
      elevation: 2,
      child: SizedBox(
          height: 80.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.alarm),
                ConstantWidget().gapeW8(),
                Text(
                  widget.time,
                  style: AllTextStyle().textRegularStyle16(color: widget.color),
                ),
                const Spacer(),
                Text(
                  widget.mediceneName,
                  style: AllTextStyle().textRegularStyle16(
                      color: widget.color, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )),
    );
  }
}
