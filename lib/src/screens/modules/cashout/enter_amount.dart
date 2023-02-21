import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class CashoutEnterAmount extends StatefulWidget {
  const CashoutEnterAmount({ Key? key }) : super(key: key);

  @override
  _CashoutEnterAmountState createState() => _CashoutEnterAmountState();
}

class _CashoutEnterAmountState extends State<CashoutEnterAmount> {
  String text = '';

  _onKeyboardTap(String value){
    setState(() {
      text = text + value;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black87,
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 75),
          child: Text(
            'Cashout',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'John Enterprises',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              SizedBox(height: 10),
              Text(
                '5050040',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18
                ),
              ),
              SizedBox(height: size.height / 5),
              Text(
                text.isEmpty ? 'Enter Amount' : text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: size.height / 17),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: kOrangeMain,
                rightButtonFn: () {
                  // setState(() {
                  //   text = text.substring(0, text.length - 1);
                  // });
                },
                leftButtonFn: () => Navigator.popAndPushNamed(context, 'confirmation_password'),
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