import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_alarm/app/constants/all_color.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/widget/weekly_button.dart';

class ActiveAlarmCard extends StatelessWidget {
  final Color color;
  final List isSelectDay;

  ActiveAlarmCard(
      {Key? key, this.color = AllColors.pureWhite, required this.isSelectDay})
      : super(key: key);
  List weekName = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thus',
    'Fri',
  ];
  List alermTime = [
    '9:00',
    '10:00',
    '11:00',
    '12:00',
    '1:00',
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
                Text('Napa'),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.note_alt_outlined))
              ],
            ),
            ConstantWidget().gapeH(10),
            Wrap(
                children: List.generate(
                    weekName.length,
                    (index) => WeeklyButton(
                          dayName: weekName[index],
                          dayTime: alermTime[index],
                          isSelecDay: isSelectDay,
                          index: index,
                        ))),
            ConstantWidget().gapeH16(),
            Text("With After Before Mill")
          ],
        ),
      ),
    );
  }
}
