import 'package:airpay/src/screens/modules/send_money/amount_screen.dart';
import 'package:airpay/src/screens/password_confirmation/index.dart';
import 'package:get/get.dart';
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/services/sendmoney_service.dart';
import 'package:airpay/src/controllers/base_controller.dart';

class SendmoneyController extends GetxController with BaseController {
  var isLoading = false.obs;
  final sendamount = ''.obs;

  void checkPhone(phone) async{
    var phonenumber = '+254'+phone;
    isLoading(true);

    await SendmoneyService().get(AppConstant.url, 'user/$phonenumber')
    .then((value){
      Get.to(EnterAmountScreen(), arguments: value);
    }).catchError((error){
      handleError(error);
    });
  }

  void amountStep(user, amount){
    // print(user.name);
    sendamount.value = amount;

    Get.to(PasswordConfirmation(), arguments: user);
  }
}
