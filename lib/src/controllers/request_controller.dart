import 'package:get/get.dart';
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/controllers/base_controller.dart';
import 'package:airpay/src/models/requests_model.dart';
import 'package:airpay/src/screens/confirmation/index.dart';
import 'package:airpay/src/services/request_service.dart';

class RequestController extends GetxController with BaseController {
  var recentRequests = Request(requests: []).obs;
  var allRequests = Request(requests: []).obs;

  @override
  void onInit(){
    fetchRecentRequests();
    fetchAllRequests();
    super.onInit();
  }

  void fetchAllRequests() async {
    var response = await RequestService.fetchAllRequests();
    allRequests.value = response;
  }

  void fetchRecentRequests() async{
    var response = await RequestService.fetchRecentRequests();
    recentRequests.value = response;
  }

  void sendRequest(user, amount) async{
    // var initiator;
    var body = {
      'initiator': '+254700632482',
      'type': 'Send money',
      'recipient': user.phone,
      'amount': amount
    };
    await RequestService().post(AppConstant.url, 'request/init', body)
    .then((value){
      Get.to(ConfirmationScreen(), arguments: {user, 'Send money'});
    }).catchError((error) {
      handleError(error);
    });
  }
}