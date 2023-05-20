import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/widget/weekly_button.dart';

import '../constants/text_style.dart';

class ActiveAlarmCard extends StatelessWidget {
  final Color color;
  final List isSelectDay;

  ActiveAlarmCard(
      {Key? key, this.color = AllColors.pureWhite, required this.isSelectDay})
      : super(key: key);
  List weekName = [
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ];
  List alermTime = [
    '9:00',
    '10:00',
    '11:00',
    '12:00',
    '1:00',
    '4:00',
    '4:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Napa',
                  style: AllTextStyle().textRegularStyle16(fontSize: 20),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                    ))
              ],
            ),
            ConstantWidget().gapeH(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day: ',
                  style: AllTextStyle().textRegularStyle(fontSize: 20),
                ),
                Wrap(
                    children: List.generate(
                        weekName.length,
                        (index) => Column(
                              children: [
                                WeeklyButton(
                                  dayName: weekName[index],
                                  isSelecDay: isSelectDay,
                                  index: index,
                                ),
                              ],
                            ))),
              ],
            ),
            ConstantWidget().gapeH16(),
            Row(
              children: [
                Text('Time: '),
                Text(
                  alermTime.join(",  "),
                  style: AllTextStyle()
                      .textRegularStyle(color: AllColors.primaryColor),
                ),
              ],
            ),
            ConstantWidget().gapeH16(),
            Text("With After Before Mill")
          ],
        ),
      ),
    );
  }
}
