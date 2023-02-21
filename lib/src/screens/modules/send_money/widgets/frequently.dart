import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';

class FrequentlySent extends StatelessWidget {
  const FrequentlySent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          child: SizedBox(
            height: size.height / 9,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kOrangeMain,
                  child: Text(
                    'JK',
                    style: TextStyle(
                      color: Colors.white54
                    ),
                  ),
                ),
                Text(
                  'James Kaigai',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}