import 'package:get/get.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController
  // List<ListItem> _items = [
  //   ListItem(txt: "Our Services", icon: Icons.unorder),
  //   ListItem(title: 'MYSELF', isSelected: false, icon: Icons.cake),
  //   ListItem(title: 'I', isSelected: false, icon: Icons.camera),
  // ];

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
