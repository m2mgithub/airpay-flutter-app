import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:airpay/src/controllers/airtime_controller.dart';

class AirtimeMessage extends StatelessWidget {
  AirtimeMessage({Key? key}) : super(key: key);
  final AirtimeController _airtimeController = Get.put(AirtimeController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.popAndPushNamed(context, 'dashboard'),
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.black87
            )
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Text(
                  'JPEG01ADF Confirmed. You have successfully Bought airtime of ${_airtimeController.selectedPackagePrice.value}.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reverse',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, 'dashboard'),
                    child: Container(
                      width: size.width,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                        gradient: kBlueGradient,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}