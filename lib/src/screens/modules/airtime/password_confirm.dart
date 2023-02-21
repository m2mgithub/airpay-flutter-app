import 'package:flutter/material.dart';

class AirtimePasswordConfirm extends StatelessWidget {
  const AirtimePasswordConfirm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Choose Package',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      )
    );
  }
}