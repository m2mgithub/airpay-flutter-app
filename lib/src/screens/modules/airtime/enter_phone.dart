import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class EnterOtherPhone extends StatefulWidget {
  const EnterOtherPhone({ Key? key }) : super(key: key);

  @override
  _EnterOtherPhoneState createState() => _EnterOtherPhoneState();
}

class _EnterOtherPhoneState extends State<EnterOtherPhone> {
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
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              SizedBox(height: size.height / 17),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: kOrangeMain,
                rightButtonFn: () {
                  setState(() {
                    text = text.substring(0, text.length - 1);
                  });
                },
                leftButtonFn: () => Navigator.pushNamed(context, 'airtime_package'),
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