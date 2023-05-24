import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_alarm/app/constants/constant_widget.dart';
import 'package:medicine_alarm/app/constants/text_style.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AboutView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Who we are",
                          style: AllTextStyle().textRegularStyle16(),
                        )),
                        ConstantWidget().gapeH8(),
                        Text(
                          'Before anything else, HRSOFTBD want you to know this: We love whatwe do. By the time we are finished with your project, you will love what we dotoo.\n\nHRSOFTBD’s team is smart, passionate, and creative, and our integrity andcommitment are unmatched. We have more than 6 years of experience deliveringsoftware solutions to a wide variety of clients and industries in the Bangladesh. Wehave over 13 Bangladesh based software professionals at Surge eager to exceedyour expectations.\n\nHRSOFTBD works with honesty. We create great user experiences every day. Weare committed to your project and can’t wait to see that look of joy on your face asyour idea takes shape.',
                          style: AllTextStyle().textRegularStyle16(),
                        ),
                      ],
                    ),
                  ),
                ),
                ConstantWidget().gapeH16(),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Our Services",
                          style: AllTextStyle().textRegularStyle16(),
                        )),
                        ConstantWidget().gapeH8(),
                        // ListView.builder(
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return Row(
                        //       children: [
                        //
                        //
                        //       ],
                        //     )
                        //   },
                        //
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
