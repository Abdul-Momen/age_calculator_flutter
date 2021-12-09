import 'package:get/get.dart';

class HomeController extends GetxController {
  final age = Rxn<Duration>();

  void calculateAge(DateTime dateOfBirth) {
    age.value = DateTime.now().difference(dateOfBirth);
  }
}
