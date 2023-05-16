import 'package:get/get.dart';

import '../modules/add_medicine/bindings/add_medicine_binding.dart';
import '../modules/add_medicine/views/add_medicine_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/running/bindings/running_binding.dart';
import '../modules/running/views/running_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RUNNING,
      page: () => const RunningView(),
      binding: RunningBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEDICINE,
      page: () => const AddMedicineView(),
      binding: AddMedicineBinding(),
    ),
  ];
}
