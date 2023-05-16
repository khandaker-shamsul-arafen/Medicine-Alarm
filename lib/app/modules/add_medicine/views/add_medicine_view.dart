import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_medicine_controller.dart';

class AddMedicineView extends GetView<AddMedicineController> {
  const AddMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddMedicineView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddMedicineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
