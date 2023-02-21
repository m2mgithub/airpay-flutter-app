import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/services/base_service.dart';
import 'package:airpay/src/helpers/dialog_helper.dart';
import 'package:airpay/src/screens/dashboard/index.dart';
import 'package:airpay/src/controllers/base_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController  with BaseController{
  var phonenumber = ''.obs;
  final box = GetStorage();
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  // final TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController;
  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    // phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void onClose() {
    // phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void tooglePassword(){
    if(obscurePassword.value == true){
      obscurePassword.value = obscurePassword(false);
    } else {
      obscurePassword.value = obscurePassword(true);
    }
  }

  void loginAction() async {
    isLoading(true);
    var phone = phonenumber.value;
    var password = passwordController.text;

    var body = {
      'phone': phone,
      'password': password
    };

    await BaseService().post(AppConstant.url, 'auth/login', body)
    .then((value) {
      storage.write(key: 'Bearer', value: value.token);
      isLoading(false);
      // box.write('token', value.token);
      storeToken(value.token);
      DialogHelper.showSuccessDialog(message: 'You have successfully logged in');
      Get.to(DashboardScreen());
    }).catchError((error){
        handleError(error);
        isLoading(false);
    }).whenComplete(() => isLoading(false));
  }

  void storeToken(token) async{
    await storage.write(key: 'token', value: token);
  }
}