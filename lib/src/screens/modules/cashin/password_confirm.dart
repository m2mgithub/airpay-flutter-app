import 'package:airpay/src/controllers/cashin_controller.dart';
import 'package:airpay/src/controllers/profile_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashinConfirmPassword extends StatefulWidget {
  const CashinConfirmPassword({ Key? key }) : super(key: key);

  @override
  _CashinConfirmPasswordState createState() => _CashinConfirmPasswordState();
}

class _CashinConfirmPasswordState extends State<CashinConfirmPassword> {
  final CashinController _cashinController = Get.put(CashinController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black87
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Confirm Password',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 2
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 9),
              Expanded(
                flex: 1,
                child: Obx(() => Text(
                  'Cash in ${_cashinController.amount} amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
              SizedBox(height: size.height * .1),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
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
                            _cashinController.sendmoneyRequest(_profileController.phone, _cashinController.amount);
                            // _requestController.sendRequest(user, _sendmoneyController.sendamount.value);
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
    );
  }
}