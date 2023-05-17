import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';

import '../constants/all_color.dart';
import '../constants/text_style.dart';

class HomeCard extends StatelessWidget {
  final String time;
  final String mediceneName;
  Color color;

  const HomeCard

  (

  color{
  Key? key,
  required this.time,
  required this.mediceneName,
  }) : super(key: key);

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
  Icon(Icons.alarm),
  ConstantWidget().gapeW8(),
  Text(
  'Next Medicine ',
  style: AllTextStyle()
      .textRegularStyle16(color: AllColors.primaryColor),
  ),
  Spacer(),
  Text(
  'Napa 500 ',
  style: AllTextStyle().textRegularStyle16(
  color: AllColors.primaryColor,
  fontWeight: FontWeight.w400),
  ),
  ],
  ),
  )),
  );
  }
}
