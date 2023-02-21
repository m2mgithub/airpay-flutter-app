import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: mainColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Airpay.'
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'dashboard'),
                child: const Text(
                  'Go to dashboard page'
                ),
              )
            ],
          )
        )
      )
    );
  }
}