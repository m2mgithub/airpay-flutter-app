import 'package:airpay/src/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black87
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kBlackMain
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height / 10),
                  Text(
                    'New Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87
                    )
                  ),
                  Text(
                    'Kindly enter a new password to continue',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87
                    )
                  ),
                  SizedBox(height: size.height / 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      )
                    )
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      )
                    )
                  ),
                  SizedBox(height: size.height / 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'login'),
                    child: Container(
                      height: size.height / 14,
                      width: size.width,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        gradient: kBlueGradient,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'RESET',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        )
      ),
    );
  }
}