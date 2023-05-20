import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConstantWidget {
  Widget gapeH(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget gapeW(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget gapeH8() {
    return SizedBox(
      height: 8.h,
    );
  }

  Widget gapeH16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget gapeW8() {
    return SizedBox(
      width: 8.w,
    );
  }

  Widget gapeW16() {
    return SizedBox(
      width: 16.w,
    );
  }
}
