import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/widget/weekly_button.dart';

import '../constants/text_style.dart';

class ActiveAlarmCard extends StatelessWidget {
  final List isSelectDay;
  final bool inActive;

  ActiveAlarmCard({Key? key, required this.isSelectDay, this.inActive = false})
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
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (inActive)
          ? AllColors.lightRed
          : AllColors.greyWhite.withOpacity(1.0),
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
                  'Diphenhydramine',
                  style: AllTextStyle().textRegularStyle16(
                      fontSize: 20,
                      color: (inActive)
                          ? AllColors.pureWhite
                          : AllColors.pureBlack),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.note_alt_outlined,
                      size: 18,
                      color: (inActive)
                          ? AllColors.pureWhite
                          : AllColors.pureWhite,
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
                  style: AllTextStyle().textRegularStyle(
                    fontSize: 20,
                    color:
                        (inActive) ? AllColors.pureWhite : AllColors.pureBlack,
                  ),
                ),
                Wrap(
                    children: List.generate(
                        weekName.length,
                        (index) => WeeklyButton(
                          dayName: weekName[index],
                              isSelecDay: isSelectDay,
                              index: index,
                              inactiveText: (inActive) ? true : false,
                            ))),
              ],
            ),
            ConstantWidget().gapeH16(),
            Row(
              children: [
                Text('Time: ',
                    style: AllTextStyle().textRegularStyle(
                        color: (inActive)
                            ? AllColors.pureWhite
                            : AllColors.pureBlack)),
                Text(
                  alermTime.join(",  "),
                  style: AllTextStyle().textRegularStyle(
                      color: (inActive)
                          ? AllColors.pureWhite
                          : AllColors.pureBlack),
                ),
              ],
            ),
            ConstantWidget().gapeH16(),
            Row(
              children: [
                Text(
                  "Duration: ",
                  style: AllTextStyle().textRegularStyle(
                      color: (inActive)
                          ? AllColors.pureWhite
                          : AllColors.pureBlack),
                ),
                (inActive)
                    ? Text("5-05-2023 to 7-05-2023",
                        style: AllTextStyle()
                            .textRegularStyle(color: AllColors.pureWhite))
                    : const Text("With After Before Mill"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
