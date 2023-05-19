import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';

import '../../../constants/all_color.dart';
import '../../../constants/text_style.dart';
import '../../../widget/add_time_card.dart';
import '../../../widget/home_card.dart';
import '../controllers/add_medicine_controller.dart';

class AddMedicineView extends GetView<AddMedicineController> {
  const AddMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w, right: 16.0.w),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  // <-- Icon
                  Icons.cancel_outlined,
                  size: 30.0,
                  color: Colors.red,
                ),
                label: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, elevation: 0.5), // <-- Text
              ),
              ConstantWidget().gapeH(16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Medicine name",
                  labelStyle: AllTextStyle().textRegularStyle16(
                      color: AllColors.pureBlack.withOpacity(0.6)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.name,
              ),
              ConstantWidget().gapeH16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .4,
                    height: 45.h,
                    child: TextField(
                      controller: controller.textController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),

                        hintMaxLines: 1,
                        suffixIcon: InkWell(
                          onTap: () async {
                            controller.pickedDate.value = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            ))!;
                            debugPrint(
                                "PickDate i: ${controller.pickedDate.value}");
                            //  if (controller.pickedDate != null &&
                            //  controller.pickedDate.compareTo(DateTime.now()) >= -1) {
                            //    //  widget.controller.text = pickedDate.toString();
                            //  }
                          },
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            //  color: AppColors.borderColor,
                          ),
                        ),
                        //fillColor: AllColors.pureWhite,
                        filled: true,
                        labelText: "Start Date",
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(border: Border.all()),
                    child: SpinBox(
                      min: 0,
                      max: 500,
                      value: controller.count.value,
                      onChanged: (value) {
                        controller.count.value = value;
                        print(controller.count.value);
                      },
                      step: 10,
                      spacing: 0,
                      direction: Axis.horizontal,
                      textStyle: TextStyle(fontSize: 16),
                      incrementIcon: Icon(Icons.keyboard_arrow_up, size: 24),
                      decrementIcon: Icon(Icons.keyboard_arrow_down, size: 24),
                      iconColor: MaterialStateProperty.resolveWith((states) {
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
              Text('Time'),
              ConstantWidget().gapeH8(),
              Wrap(
                children: List.generate(
                    controller.time.value.length,
                    (index) => Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: AddTimeCard(
                            time: controller.time[index],
                          ),
                        )),
              ),
              Center(
                child: TextButton.icon(
                  // <-- TextButton
                  onPressed: () {
                    showForm(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  label: const Text('ADD'),
                ),
              ),
              ConstantWidget().gapeH(30.h),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 105.0, horizontal: 10.0),
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Add Your Note ",
                    hintStyle: AllTextStyle().textRegularStyle()),
              ),
              ConstantWidget().gapeH(16.h),
              SizedBox(
                  width: Get.width,
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: AllTextStyle()
                          .textRegularStyle16(color: AllColors.pureWhite),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.primaryColor),
                  )),
            ],
          );
        }),
      ),
    ));
  }

  void showForm(context) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              height: 500,
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: controller.timeController,
                    decoration: const InputDecoration(hintText: 'Time'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controller.time.value.add(controller.timeController.text);
                      print("sfsfsfsf" + controller.time[0]);
                      controller.timeController.text = '';
                      Navigator.of(context).pop();
                    },
                    child: const Text('Create New'),
                  )
                ],
              ),
            ));
  }
}
