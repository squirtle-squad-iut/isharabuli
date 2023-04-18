import 'package:IsharaBuli/utils/exports.dart';

class SignupLoginScreen extends StatefulWidget {
  const SignupLoginScreen({Key? key}) : super(key: key);

  @override
  _SignupLoginScreenState createState() => _SignupLoginScreenState();
}

class _SignupLoginScreenState extends State<SignupLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("image/Black.png"),
                    const SizedBox(
                      height: 50,
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: SignUpContainer(st: "Sign Up"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: LoginContainer(st: "Log In"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //Text("data"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
