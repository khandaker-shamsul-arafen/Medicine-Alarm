import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/all_color.dart';
import '../constants/text_style.dart';

class HomeCard extends StatefulWidget {
  final String time;
  final String mediceneName;

  const HomeCard({
    Key? key,
    required this.time,
    required this.mediceneName,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          surfaceTintColor: AllColors.greyWhite.withOpacity(1.0),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Icon(Icons.alarm),
                // ConstantWidget().gapeW8(),
                Text(
                  widget.mediceneName,
                  style:
                      AllTextStyle().textRegularStyle16(color: AllColors.grey),
                ),
                // const Spacer(),
                Text(
                  widget.time + ' PM',
                  style: AllTextStyle().textRegularStyle16(
                      color: AllColors.darkGrey, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
