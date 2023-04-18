import 'package:firebase_auth/firebase_auth.dart';
import 'package:IsharaBuli/utils/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    const Image(image: AssetImage("image/Black.png")),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    const SizedBox(width: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email", hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20, width: 30),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password", hintText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20, width: 30),

                    Row(
                      children: [
                        Checkbox(
                          value: _value,
                          onChanged: (newValue) {
                            setState(() {
                              _value = newValue!;
                              // storeUserCredentials(String email, String password)
                            });
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.kBlackColor),
                            );
                          },
                        ),
                        Spacer(),
                        const TextButton(
                          onPressed: null,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                    InkWell(
                      child: SignUpContainer(st: "LogIn"),
                      onTap: () {
                        signIn(_emailController.text, _passwordController.text, context);
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: RichText(
                        text: RichTextSpan(
                            one: "Don’t have an account ? ", two: "Sign Up"),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                      },
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

Future<String?> signIn(String email, String password, context) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User user = userCredential.user;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage()));
    return 'success';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      Fluttertoast.showToast(
          msg: "Wrong password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0
      );

      return 'Wrong password provided for that user.';
    }
    return e.message;
  } catch (e) {
    return e.toString();
  }
}



void storeUserCredentials(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  prefs.setString('password', password);
}