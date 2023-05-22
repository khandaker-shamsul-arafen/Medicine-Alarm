import 'package:custom_timer/custom_timer.dart';
import 'package:get/get.dart';

import '../../add_medicine/controllers/add_medicine_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement HomeController
  final addMedicineController = Get.find<AddMedicineController>();
  RxInt index = 0.obs;

  // late CustomTimerController timerController = CustomTimerController(
  //     vsync: this,
  //     begin: Duration(
  //         hours: (addMedicineController.time.length == 0)
  //             ? 0
  //             : int.parse(addMedicineController.time[0]) - DateTime.now().hour,
  //         minutes: 12),
  //     end: Duration(),
  //     initialState: CustomTimerState.reset,
  //     interval: CustomTimerInterval.milliseconds);

  late CustomTimerController timerController = CustomTimerController(
      vsync: this,
      begin: Duration(
        hours: (addMedicineController.time.isEmpty)
            ? 0
            : (index.value < addMedicineController.time.length)
                ? int.parse(addMedicineController.time[index.value]) -
                    DateTime.now().hour
                : 0,
        minutes: (addMedicineController.time2.isEmpty)
            ? 0
            : (index.value < addMedicineController.time2.length)
                ? int.parse(addMedicineController.time2[index.value]) -
                    58 // DateTime.now().minute
                : 0,
        //    minutes: int.parse(addMedicineController.time[index.value]),
      ),
      end: const Duration(),
      initialState: CustomTimerState.counting,
      interval: CustomTimerInterval.milliseconds);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //  timerController.start();
    //    timer.addListener(() {
    //      print('hello');
    //      print(timer.state.value);
    // //     index.value++;
    //      timer.start();
    //
    //      print(timer.remaining.value.seconds.toString());
    //    });
    timerController.start();
    timerController.state.addListener(() {
      index.value++;
      print(index.toString());
      print(DateTime.now().hour);
      if (index.value < addMedicineController.time.length) {
        print('So');
        timerController.begin = Duration(
          hours: int.parse(addMedicineController.time[index.value]) -
              DateTime.now().hour,
          minutes: int.parse(addMedicineController.time2[index.value]),
        );
        timerController.start();
      }

      // 👉 12h
    });

    print(DateTime.now().hour.toString());
    // timerController.state.addListener(() {
    //   print('Shanto');
    //   index.value++;
    //   print(index.toString());
    //   if (index.value < addMedicineController.time.length) {
    //     timerController.start();
    //   }
    //
    //   // 👉 12h
    // });
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
