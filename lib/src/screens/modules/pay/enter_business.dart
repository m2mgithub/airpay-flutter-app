import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class EnterBusiness extends StatefulWidget {
  const EnterBusiness({ Key? key }) : super(key: key);

  @override
  _EnterBusinessState createState() => _EnterBusinessState();
}

class _EnterBusinessState extends State<EnterBusiness> {
  String paybill = '';

  _onKeyboardTap(String value){
    setState(() {
      paybill = paybill + value;
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
            color: Colors.black87
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Enter Business Number',
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
              paybill.isEmpty ? 'Enter Paybill' : paybill,
              style: TextStyle(
                fontSize: 20,
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
                setState(() {
                  paybill = paybill.substring(0, paybill.length - 1);
                });
              },
              leftButtonFn: () => Navigator.pushNamed(context, 'paybill_enter_amount'),
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
      ),
    );
  }
}