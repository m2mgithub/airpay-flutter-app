import 'package:airpay/src/controllers/sendmoney_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({ Key? key }) : super(key: key);

  @override
  _EnterPhoneScreenState createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final SendmoneyController _controller = Get.put(SendmoneyController());

  String text = '';

  _onKeyboardTap(String value){
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black87,
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Send Money',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              text.isEmpty ? 'Enter Phone Number' : text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 20),
            NumericKeyboard(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onKeyboardTap: _onKeyboardTap,
              textColor: kOrangeMain,
              rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                });
              },
              leftButtonFn: () {
                _controller.checkPhone(text);
              },
              rightIcon: Icon(
                Icons.backspace_outlined,
                color: kOrangeMain,
              ),
              leftIcon: Icon(
                Icons.check,
                color: kOrangeMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}