import 'package:airpay/src/controllers/request_controller.dart';
import 'package:airpay/src/controllers/sendmoney_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordConfirmation extends StatefulWidget {
  const PasswordConfirmation({ Key? key }) : super(key: key);

  @override
  _PasswordConfirmationState createState() => _PasswordConfirmationState();
}

class _PasswordConfirmationState extends State<PasswordConfirmation> {
  final SendmoneyController _sendmoneyController = Get.put(SendmoneyController());
  final RequestController _requestController = Get.put(RequestController());

  final user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 9),
              Expanded(
                flex: 1,
                child: Text(
                  'Send ${_sendmoneyController.sendamount.value} to \n${user.name} \n ${user.phone}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * .1),
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
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: size.height / 12,
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: size.width * .4,
                            height: size.height / 14,
                            decoration: BoxDecoration(
                              gradient: kOrangeGradient,
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
                        GestureDetector(
                          onTap: () {
                            _requestController.sendRequest(user, _sendmoneyController.sendamount.value);
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
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87
          ),
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
        ),
      ),
    );
  }
}