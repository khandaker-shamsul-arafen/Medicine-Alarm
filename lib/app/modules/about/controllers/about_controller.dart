import 'package:get/get.dart';

import '../../../widget_model/listItem.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController
  RxList<Items> items = [
    Items(
      txt: "Website Design and Development",
    ),
    Items(
      txt: 'Complex Web Application Development.',
    ),
    Items(
      txt: 'Software Development.',
    ),
    Items(
      txt: 'Android And IOS App Development',
    ),
    Items(
      txt: 'Desktop Application Development.',
    ),
    Items(
      txt: 'OMR Solution.',
    ),
    Items(
      txt: 'Image Processing.',
    ),
    Items(
      txt: 'E-Commerce Solution.',
    ),
    Items(
      txt: 'BULK SMS Marketing.',
    ),
    Items(
      txt: 'Voice Call And Voice SMS Marketing.',
    ),
    Items(
      txt: 'Digital Marketing.',
    ),
    Items(
      txt: 'Search Engine Optimization (SEO).',
    ),
    Items(
      txt: 'Enterprise Resource Planning (ERP) solution.',
    ),
    Items(
      txt: 'Domain And Hosting.',
    ),
    Items(
      txt: 'IT Consultancy Services etc',
    ),
  ].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
