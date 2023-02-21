import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController{
  final greeting = ''.obs;
  final box = GetStorage();

  void onInit(){
    greetingsFunc();
    
    super.onInit();
  }

  void greetingsFunc() {
    var hour = DateTime.now().hour;
    box.remove('token');

    if(hour <= 12) {
      greeting.value = 'Good Morning';
    } else if((hour > 12) && (hour <= 16)) {
      greeting.value = 'Good Afternoon';
    } else if((hour > 15) && (hour < 20)) {
      greeting.value = 'Good Evening';
    }
  }
}