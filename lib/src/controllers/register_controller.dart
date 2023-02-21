import 'package:airpay/src/helpers/dialog_helper.dart';
import 'package:airpay/src/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/controllers/base_controller.dart';

class RegisterController extends GetxController with BaseController {
  var termsChecked = false.obs;
  var phonenumber = ''.obs;
  var isLoading = false.obs;
  var obscurePassword = true.obs;

  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
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

  void checkTerms(value){
    termsChecked.value = value;
  }

  void registerAction() async {
    isLoading(true);
    var country = 'KE';
    var firstname = firstnameController.text;
    var lastname = lastnameController.text;
    var email = emailController.text;
    var phone = phonenumber.value;
    var password = passwordController.text;

    var body = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'country': country,
      'password': password,
      'terms': 1,
    };

    await RegisterService().post(AppConstant.url, 'auth/register', body)
    .then((value) {
      DialogHelper.showSuccessDialog(message: 'You have successfully registered an account');
    }).catchError((error){
      handleError(error);
    }).whenComplete(() => isLoading(false));
  }
}