import 'package:airpay/src/models/wallet_model.dart';
import 'package:airpay/src/services/wallet_service.dart';
import 'package:get/get.dart';

class WalletController extends GetxController{
  var wallet = Wallet().obs;
  var balance = 0.obs;

  @override
  void onInit(){
    // fetchWallet();
    super.onInit();
  }

  @override
  void onClose(){
    super.onClose();
    fetchWallet();
  }

  void fetchWallet() async{
    var response = await WalletService.fetchWallet();
    // wallet.value = response;
    balance.value = response.currentBalance!;
  }
}