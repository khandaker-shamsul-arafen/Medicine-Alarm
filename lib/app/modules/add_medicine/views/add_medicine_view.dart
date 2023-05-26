import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';

import '../../../constants/all_color.dart';
import '../../../constants/text_style.dart';
import '../../../widget/add_time_card.dart';
import '../../../widget/weekly_button.dart';
import '../controllers/add_medicine_controller.dart';

class AddMedicineView extends GetView<AddMedicineController> {
  const AddMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w, right: 16.0.w),
          child: Obx(
            () {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Add Your Medicine Time',
                        style: AllTextStyle().textRegularStyle16(fontSize: 24),
                      ),
                    ),
                    ConstantWidget().gapeH(16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Medicine name",
                        labelStyle: AllTextStyle().textRegularStyle16(
                            color: AllColors.pureBlack.withOpacity(0.6)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    ConstantWidget().gapeH16(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Starting Date",
                              style: AllTextStyle().textRegularStyle(
                                fontSize: 20,
                                color: AllColors.pureBlack,
                              ),
                            ),
                            ConstantWidget().gapeH8(),
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              height: 55.h,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0.w),
                                    child: Text(controller.pickedDate.value,
                                        style: AllTextStyle()
                                            .textRegularStyle16()),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () async {
                                      DateTime pickedDate =
                                          (await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2050),
                                      ))!;
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(formattedDate);
                                        controller.pickedDate.value =
                                            formattedDate; //set output date to TextField value.
                                      } else {
                                        print("Date is not selected");
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ConstantWidget().gapeW16(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Continue Date",
                              style: AllTextStyle().textRegularStyle(
                                fontSize: 20,
                                color: AllColors.pureBlack,
                              ),
                            ),
                            ConstantWidget().gapeH8(),
                            Container(
                              width: MediaQuery.of(context).size.width * .35,
                              height: 55.h,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SpinBox(
                                min: 0,
                                max: 500,
                                value: controller.count.value,
                                onChanged: (value) {
                                  controller.count.value = value;
                                  print(controller.count.value);
                                },
                                step: 1,
                                spacing: 6,
                                textStyle: const TextStyle(fontSize: 18),
                                incrementIcon: const Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 24),
                                decrementIcon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 24),
                                iconColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.grey;
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return Colors.red;
                                  }
                                  if (states.contains(MaterialState.focused)) {
                                    return Colors.blue;
                                  }
                                  return Colors.black;
                                }),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ConstantWidget().gapeH(20),
                    Row(
                      children: [
                        Text(
                          'Time: ',
                          style: AllTextStyle().textRegularStyle(
                            fontSize: 20,
                            color: AllColors.pureBlack,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.time.value.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(4.0.r),
                                      child: Obx(() {
                                        return AddTimeCard(
                                          time: controller.time[index],
                                          dayTime: controller.dayTime[index],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ConstantWidget().gapeH16(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          showPicker(
                            dialogInsetPadding: EdgeInsets.symmetric(
                                horizontal: 24.0.w, vertical: 24.0.h),
                            width: Get.width * 0.9,
                            showSecondSelector: true,
                            context: context,
                            value: controller.time1,
                            onChange: controller.onTimeChanged,
                            minuteInterval: TimePickerInterval.FIVE,
                            // Optional onChange to receive value as DateTime
                            onChangeDateTime: (DateTime dateTime) {
                              // print(dateTime);
                              (dateTime.hour.toInt() > 12)
                                  ? controller.time.add(
                                      (dateTime.hour.toInt() - 12).toString())
                                  : controller.time
                                      .add((dateTime.hour.toString()));
                              (dateTime.hour.toInt() > 12)
                                  ? controller.dayTime.add(('PM'))
                                  : controller.dayTime.add('AM');
                              //    controller.periods.add(dateTime.)

                              debugPrint(
                                  "[debug datetime]:  ${controller.time[0]}");
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 30.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                                color: AllColors.primaryColor, width: 2.w),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 24.0,
                                color: AllColors.primaryColor,
                              ),
                              Text(
                                'ADD',
                                style: AllTextStyle().textRegularStyle16(
                                    color: AllColors.primaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ConstantWidget().gapeH(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Day: ',
                          style: AllTextStyle().textRegularStyle(
                            fontSize: 20,
                            color: AllColors.pureBlack,
                          ),
                        ),
                        ConstantWidget().gapeW8(),
                        Wrap(
                            children: List.generate(
                                controller.weekName.length,
                                (index) => WeeklyButton(
                                      dayName: controller.weekName[index],
                                      isSelecDay: controller.isSelectWeekDay,
                                      index: index,
                                      inactiveText: false,
                                    ))),
                      ],
                    ),
                    ConstantWidget().gapeH(16.h),
                    Wrap(
                      children: [
                        TextFormField(
                          maxLines: 3,
                          maxLength: 100,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blueGrey, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Add Your Note ",
                              hintStyle: AllTextStyle()
                                  .textRegularStyle(fontSize: 16)),
                        ),
                        ConstantWidget().gapeH16(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AllColors.primaryColor.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: Text(
                              "Save",
                              style: AllTextStyle().textRegularStyle16(
                                  color: AllColors.pureWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
