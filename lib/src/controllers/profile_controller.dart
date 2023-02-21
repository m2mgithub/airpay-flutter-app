import 'package:airpay/src/models/user_model.dart';
import 'package:airpay/src/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  var profile = User().obs;
  var name = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;

  @override
  void onInit(){
    fetchProfile();
    super.onInit();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void fetchProfile() async{
    var response = await ProfileService.fetchProfile();
    name.value = response.name!;
    phone.value = response.phone!;
    email.value = response.email!;
  }
}