import 'package:airpay/src/controllers/sendmoney_controller.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EnterAmountScreenState createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final SendmoneyController _controller = Get.put(SendmoneyController());
  String amount = '';

  _onKeyboardTap(String value){
    setState(() {
      amount = amount + value;
    });
  }
  final user = Get.arguments;

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
            Icons.arrow_back_outlined
          )
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Send money to',
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${user.phone}',
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              SizedBox(height: size.height / 9),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      amount.isEmpty ? 'Enter Amount' : amount,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 17),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: kOrangeMain,
                rightButtonFn: () {
                  setState(() {
                    amount = amount.substring(0, amount.length - 1);
                  });
                },
                leftButtonFn: (){
                  _controller.amountStep(user, amount);
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
      ),
    );
  }
}

