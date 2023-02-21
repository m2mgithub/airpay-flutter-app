import 'package:airpay/src/controllers/airtime_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirtimeEnterPassword extends StatelessWidget {
  AirtimeEnterPassword({ Key? key }) : super(key: key);
  final AirtimeController _airtimeController = Get.put(AirtimeController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Enter your password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 9),
            Expanded(
              flex: 1,
              child: Obx(() => Text(
                "Buy ${_airtimeController.selectedPackageName.value} for my number.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87
                ),
                textAlign: TextAlign.center,
              )),
            ),
            // SizedBox(height: size.height * .1),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  textAlign: TextAlign.center, 
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                  ),    
                ),
              ),
            ),
            SizedBox(
              height: size.height / 14,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    _airtimeController.sendRequest();
                  },
                  child: Container(
                    width: size.width * .4,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      gradient: kBlueGradient,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              )
            ),
          ],
        ),
      )
    );
  }
}