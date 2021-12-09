import 'package:age_calculator/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.calculateAge(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Calculator"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Select Birthday:"),
                IconButton(
                  onPressed: () async {
                    await _selectDate(context);
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            Obx(() => controller.age.value == null
                ? const Text("Please select date of birth first!")
                : Text("""
                You are
                    ${controller.age.value!.inDays ~/ 365.2424} years
                    ${(controller.age.value!.inDays % 365.2424) ~/ 30} month
                    ${((controller.age.value!.inDays % 365.2424) % 30).toInt()} days
                   old
                    """))
          ],
        ),
      ),
    );
  }
}
