import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant_widget.dart';
import '../constants/text_style.dart';

class OfficeDetails extends StatelessWidget {
  const OfficeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: Get.height - 200,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(12.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Contact Us",
                style: AllTextStyle().textRegularStyle16(fontSize: 24),
              )),
              ConstantWidget().gapeH8(),
              Text(
                "Registered Office:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                "Kazi Nazrul Islam Avenue, Karwan Bazar, Dhaka-1215 ",
                style: AllTextStyle()
                    .textRegularStyle16(fontWeight: FontWeight.w400),
              ),
              ConstantWidget().gapeH8(),
              Text(
                "Corporate Office:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                "P-7, Nurzahan Road, Mohammadpur, Dhaka-1207 ",
                style: AllTextStyle().textRegularStyle(fontSize: 16),
              ),
              ConstantWidget().gapeH8(),
              Text(
                "Telephone:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                " +880258152022.",
                style: AllTextStyle().textRegularStyle(fontSize: 16),
              ),
              ConstantWidget().gapeH8(),
              Text(
                "Hotline:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                "+8801722158130, +8801709372481, +8801834014071.",
                style: AllTextStyle().textRegularStyle(fontSize: 16),
              ),
              ConstantWidget().gapeH8(),
              Text(
                "Email:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                "info@hrsoftbd.com, support@hrsoftbd.com ",
                style: AllTextStyle().textRegularStyle(fontSize: 16),
              ),
              ConstantWidget().gapeH8(),
              Text(
                "Website:",
                style: AllTextStyle().textRegularStyle16(),
              ),
              ConstantWidget().gapeH(4),
              Text(
                "www.hrsoftbd.com",
                style: AllTextStyle().textRegularStyle(fontSize: 16),
              ),
              ConstantWidget().gapeH8(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bank info: ",
                    style: AllTextStyle().textRegularStyle16(),
                  ),
                  Container(
                    child: Text(
                      'Name: Standard Chartered Bank\nA/C Name: HRSOFTBD\nA/C No: 606331601\n-------------------------------\nName: BRAC Bank\nA/C Name: HRSOFTBD\nA/C No: 1536204584759001',
                      style: AllTextStyle().textRegularStyle(fontSize: 16),
                    ),
                  )
                ],
              )
              //  Text('\u2022 Bullet Text'),
            ],
          ),
        ),
      ),
    );
  }
}
