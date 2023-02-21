import 'package:airpay/src/controllers/profile_controller.dart';
import 'package:airpay/src/screens/profile/widgets/detail_card.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({ Key? key }) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .1),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
            ),
            SizedBox(height: 10),
            Obx(() => Text(
              '${_profileController.name.value}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black87
              ),
            )),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailCard(title: 'phone', detail: '${_profileController.phone.value}'),
                  SizedBox(height: 20),
                  DetailCard(title: 'email', detail: '${_profileController.email.value}'),
                  SizedBox(height: 20),
                  DetailCard(title: 'Address', detail: 'Nairobi Avenue, \n Corner Street'),
                ],
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new_outlined,
                    size: 28,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sign out',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}