import 'package:IsharaBuli/utils/exports.dart';
import 'package:IsharaBuli/views/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // runApp(const LoginScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ইশারা বুলি',
      locale: const Locale('bn', 'BD'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // to remode the debug badge
      home: AnimatedSplashScreen(
          splash: Image.asset('image/Black.png'),
          splashIconSize: 200,
          duration: 5000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color.fromARGB(255, 53, 164, 219),
          nextScreen: SignupLoginScreen()),
    );
  }
}
