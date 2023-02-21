import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/controllers/base_controller.dart';
import 'package:airpay/src/screens/modules/cashin/message.dart';
import 'package:airpay/src/screens/modules/cashin/password_confirm.dart';
import 'package:airpay/src/services/cashin_service.dart';
import 'package:airpay/src/services/request_service.dart';
import 'package:get/get.dart';

class CashinController extends GetxController with BaseController {
  var amount = ''.obs;
  var message = ''.obs;

  void submitAmount(String amount){
    amount = amount;
    print(amount);

    Get.to(CashinConfirmPassword());
  }

  void sendmoneyRequest(user, amount) async{
    // var body = {
    //   'initiator': user,
    //   'type': 'Cash in',
    //   'amount': amount
    // };
    var phone = user;
    var type = 'Cash in';
    var total = amount;
      message.value = 'You have successfully cashed in NAD ${total} in your wallet account';

    await CashinService().postRequest(phone, type, total)
    .then((value) {
      // var sms = 'You have successfully cashed in'+ total +'in your wallet account';
      Get.to(ConfirmationMessage());
    }).catchError((error) {
      handleError(error);
    });

    // await RequestService().post(
    //   AppConstant.url,
    //   'request/init',
    //   body,
    // ).then((value){
    //   print(value);
    // }).catchError((error) {
    //   handleError(error);
    // });
  }
}