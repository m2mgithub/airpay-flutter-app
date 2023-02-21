import 'package:airpay/src/controllers/cashin_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class CashinScreen extends StatefulWidget {
  const CashinScreen({ Key? key }) : super(key: key);

  @override
  _CashinScreenState createState() => _CashinScreenState();
}

class _CashinScreenState extends State<CashinScreen> {
  final CashinController _cashinController = Get.put(CashinController());

  String amount = '';

  _onKeyboardTap(String value){
    setState(() {
      amount = amount + value;
    });
  }

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
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Cash In',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,

            ),
          ),
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
                'Cash In',
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
                  _cashinController.submitAmount(amount);
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