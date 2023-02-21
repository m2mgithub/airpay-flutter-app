import 'package:airpay/src/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String initialCountry = 'NM';
  PhoneNumber number = PhoneNumber(isoCode: 'NM');
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final LoginController _authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: size.width * .8,
                      height: size.height / 15
                    ),
                  ),
                  SizedBox(height: size.height * .15),
                  TextButton(
                    onPressed: () => throw Exception(),
                    child: const Text("Throw Test Exception"),
                  ),
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome back, Kindly login to continue.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black87
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      _authController.phonenumber.value = number.toString();
                    },
                    // onInputValidated: (bool value) {
                    //   print(value);
                    // },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: false,
                    initialValue: number,
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  ),
                  SizedBox(height: 20),
                  Obx(() => TextFormField(
                    controller: _authController.passwordController,
                    obscureText: _authController.obscurePassword.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _authController.tooglePassword(),
                        icon: Icon(
                          _authController.obscurePassword.value == true
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                          color: Colors.black54,
                        ),
                      )
                    )
                  )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Remember',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'new_password'),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(() => GestureDetector(
                    onTap: () {
                      if(_globalFormKey.currentState!.validate()) {
                        _authController.loginAction();
                      }
                    },
                    child: (_authController.isLoading.isTrue)
                  ? Center(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 3,
                      backgroundColor: mainColor,
                    ),
                  )
                  : Container(
                      height: size.height / 14,
                      width: size.width,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        gradient: kBlueGradient,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    )
                  )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'register'),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}