import 'package:airpay/src/controllers/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String initialCountry = 'NM';
  PhoneNumber number = PhoneNumber(isoCode: 'NM');
  bool isChecked = false;
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final RegisterController _authController = Get.put(RegisterController());

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
                  TextFormField(
                    controller: _authController.firstnameController,
                    validator: (val) {
                      if(val!.isEmpty)
                        return 'Please provide your Firstname';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'First name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      )
                    )
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _authController.lastnameController,
                    validator: (val) {
                      if(val!.isEmpty)
                        return 'Please provide your Lastname';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      )
                    )
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _authController.emailController,
                    validator: (val) {
                      if(val!.isEmpty || !val.contains('@'))
                        return 'Please provide a valid email address';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      )
                    )
                  ),
                  SizedBox(height: 23),
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
                    validator: (val) {
                      if(val!.isEmpty)
                        return 'Kindly provide a password';
                      return null;
                    },
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
                  Obx(() => TextFormField(
                    obscureText: _authController.obscurePassword.value,
                    validator: (val) {
                      if(val!.isEmpty)
                        return 'Kindly Confirm your password';
                      if(val != _authController.passwordController.text)
                        return 'Your passwords do not match';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black87
                      ),
                    )
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                        value: _authController.termsChecked.value,
                        onChanged: (bool? value) {
                          _authController.checkTerms(value);
                        }
                      )),
                      Text(
                        'Accept our ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          'terms and condition',
                          style: TextStyle(
                            fontSize: 15,
                            color: kBlueMain,
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
                        _authController.registerAction();
                      }
                    },
                    child: (_authController.isLoading.isTrue)
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          backgroundColor: mainColor,
                        )
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
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                      )
                  )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'login'),
                        child: Text(
                        'Sign In',
                          style: TextStyle(
                            fontSize: 15,
                            color: kBlueMain,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        )
      ),
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
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kBlackMain
            ),
          ),
        ),
      ),
    );
  }
}