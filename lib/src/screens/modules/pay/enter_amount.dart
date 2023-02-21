import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class PaybillEnterAmount extends StatefulWidget {
  const PaybillEnterAmount({ Key? key }) : super(key: key);

  @override
  _PaybillEnterAmountState createState() => _PaybillEnterAmountState();
}

class _PaybillEnterAmountState extends State<PaybillEnterAmount> {
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
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Enter Amount',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pay',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'DSTV',
              style: TextStyle(
                color: kBlueMain,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '5050040',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * .2),
            Text(
              amount.isEmpty ? 'Enter Amount' : amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(
              thickness: 2
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
              leftButtonFn: (){},
              rightIcon: Icon(
                Icons.backspace_outlined,
                color: kOrangeMain,
              ),
              leftIcon: Icon(
                Icons.check,
                color: kOrangeMain,
              ),
            )
          ],
        ),
      )
    );
  }
}