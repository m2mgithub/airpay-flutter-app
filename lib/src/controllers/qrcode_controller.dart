import 'package:get/get.dart';

class QrcodeController extends GetxController{
  var selectedTab = ''.obs;

  void toogleTab(value){
    selectedTab.value = value;
  }
}