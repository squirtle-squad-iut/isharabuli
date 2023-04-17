import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/utils/exports.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



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
      title: 'IsharaBuli',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
