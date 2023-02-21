import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';

class OperationContainer extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onPress;

  const OperationContainer({
    Key? key,
    required this.name,
    required this.onPress,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageUrl,
              height: 30,
              width: 30,
              color: kBlueMain,
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 12
              )
            ),
          ],
        )
      ),
    );
  }
}