// import 'package:airpay/src/screens/dashboard/index.dart';
import 'package:airpay/src/screens/authntication/login.dart';
import 'package:airpay/src/screens/authntication/new_password.dart';
import 'package:airpay/src/screens/authntication/register.dart';
import 'package:airpay/src/screens/confirmation/index.dart';
import 'package:airpay/src/screens/modules/airtime/enter_password.dart';
import 'package:airpay/src/screens/modules/airtime/enter_phone.dart';
import 'package:airpay/src/screens/modules/airtime/providers.dart';
import 'package:airpay/src/screens/modules/cashin/index.dart';
import 'package:airpay/src/screens/modules/cashin/password_confirm.dart';
import 'package:airpay/src/screens/modules/cashout/enter_amount.dart';
import 'package:airpay/src/screens/modules/cashout/enter_merchant.dart';
import 'package:airpay/src/screens/modules/pay/enter_amount.dart';
import 'package:airpay/src/screens/modules/pay/enter_business.dart';
import 'package:airpay/src/screens/modules/pay/index.dart';
import 'package:airpay/src/screens/modules/send_money/enter_phone.dart';
import 'package:airpay/src/screens/modules/send_money/index.dart';
import 'package:airpay/src/screens/notifications/index.dart';
import 'package:airpay/src/screens/password_confirmation/index.dart';
import 'package:airpay/src/screens/qrscanner/index.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/screens/onboarding/index.dart';
import 'package:airpay/src/screens/widgets/bottomNavigationBar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case 'register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case 'onboarding':
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case 'dashboard':
        return MaterialPageRoute(builder: (context) => const BottomNavigation());
      case 'send_money':
        return MaterialPageRoute(builder: (context) => const SendMoneyScreen());
      case 'cashin':
        return MaterialPageRoute(builder: (context) => const CashinScreen());
      case 'cashin_confirm_password':
        return MaterialPageRoute(builder: (context) => const CashinConfirmPassword());
      // case 'enter_amount':
      //   return MaterialPageRoute(builder: (context) => const EnterAmountScreen());
      case 'confirmation_password':
        return MaterialPageRoute(builder: (context) => PasswordConfirmation());
      case 'confirmation':
        return MaterialPageRoute(builder: (context) => ConfirmationScreen());
      case 'qrcodescanner':
        return MaterialPageRoute(builder: (context) => QrcodeScannerScreen());
      case 'cashout_entermerchant':
        return MaterialPageRoute(builder: (context) => const EnterMerchantScreen());
      case 'cashout_enteramount':
        return MaterialPageRoute(builder: (context) => const CashoutEnterAmount());
      case 'airtime_package':
        return MaterialPageRoute(builder: (context) => AirtimePackages());
      case 'enter_otherphone':
        return MaterialPageRoute(builder: (context) => const EnterOtherPhone());
      case 'enter_airtime_password':
        return MaterialPageRoute(builder: (context) => AirtimeEnterPassword());
      case 'enter_business':
        return MaterialPageRoute(builder: (context) => EnterBusiness());
      case 'paybill_enter_amount':
        return MaterialPageRoute(builder: (context) => PaybillEnterAmount());
      case 'enter_phone':
        return MaterialPageRoute(builder: (context) => const EnterPhoneScreen());
      case 'paybill':
        return MaterialPageRoute(builder: (context) => const PaybillScreen());
      case 'new_password':
        return MaterialPageRoute(builder: (context) => const NewPasswordScreen());
      case 'notifications':
        return MaterialPageRoute(builder: (context) => const NotificationScreen());
      default:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    }
  }
}