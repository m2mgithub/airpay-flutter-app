import 'package:get/get.dart';
import 'package:airpay/src/models/package_model.dart';
import 'package:airpay/src/models/providers_models.dart';
import 'package:airpay/src/services/airtime_services.dart';
import 'package:airpay/src/controllers/base_controller.dart';
import 'package:airpay/src/screens/modules/airtime/message.dart';

class AirtimeController extends GetxController with BaseController {
  var selectedIndex = ''.obs;
  var providerSelected = ''.obs;
  var packageSelected = ''.obs;
  var selectedPackageId = ''.obs;
  var selectedPackageName = ''.obs;
  var selectedPackagePrice = 0.obs;
  var providers = Providers(providers: []).obs;
  var packages = Packages(packages: []).obs;

  @override
  void onInit(){
    fetchProviders();
    super.onInit();
  }

  void selectIndex(index, provider){
    providerSelected.value = provider;
    // print(index);
    fetchPackages();
    selectedIndex.value = index.toString();

  }

  void selectedPackage(package){
    selectedPackageId.value = package.id;
    selectedPackageName.value = package.description;
    selectedPackagePrice.value = package.amount;
  }

  void fetchPackages() async{
    var slug = providerSelected.value;

    var response = await AirtimeService.fetchPackages(slug);
    packages.value = response;
  }

  void fetchProviders() async{
    var response = await AirtimeService.fetchProviders();
    providers.value = response;
    // await AirtimeService().get(AppConstant.url, 'airtimecity/providers/airtime')
    // .then((value){
    //   // var response = await AirtimeService.fetchProviders();
    //   providers.value = value;
    
    // }).catchError((error){
    //   print('Hello');
    //   handleError(error);
    // });
  }

  void sendRequest() async{
    var type = 'Buy airtime';
    var package = selectedPackageName.value;
    var amount = selectedPackagePrice.value;

    final respons = AirtimeService.postRequest(type, package, amount);
    Get.to(AirtimeMessage());
    // Get.to();
  }
}