import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:airpay/routes/index.dart' as route;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


String? token;
final _storage = new FlutterSecureStorage();
void main() async {
  // await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  token = await _storage.read(key: "token");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBackgroundColor
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      initialRoute: (token == null) ? 'login' : 'dashboard',
      onGenerateRoute: route.RouteGenerator.generateRoute,
      // home: OnboardingScreen(),
    );
  }
}

