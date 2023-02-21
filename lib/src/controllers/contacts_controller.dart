import 'package:get/get.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactController extends GetxController{

  late List<Contact> contacts = [].obs as List<Contact>;

  @override
  void onInit(){
    fetchContacts();
    super.onInit();
  }

  void fetchContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    contacts = _contacts;
  }
}