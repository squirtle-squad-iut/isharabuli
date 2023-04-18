import 'package:firebase_auth/firebase_auth.dart';
import 'package:IsharaBuli/utils/exports.dart';

import '../home_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late String _password;
  bool _value = false;
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
                    const SizedBox(height: 20, width: 30),
                    // CustomTextField(Lone: "Email", Htwo: "Email"),
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
                      onSaved: (value) {
                      },
                    ),
                    const SizedBox(height: 20, width: 30),
                    // CustomTextField(Lone: "Password", Htwo: "Password"),
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
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    const SizedBox(height: 20, width: 30),
                    // CustomTextField(Lone: "Confirm Password", Htwo: "Confirm Password"),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Confirm Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSaved: (value) {
                      },
                    ),
                    const SizedBox(height: 20, width: 30),
                    Row(
                      children: [
                        Checkbox(
                          value: _value,
                          onChanged: (newValue) {
                            setState(() {
                              _value = newValue!;
                            });
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                    InkWell(
                      child: SignUpContainer(st: "Sign Up"),
                      onTap: () {
                        signUp(_emailController.text, _passwordController.text, context);
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: RichText(
                        text: RichTextSpan(
                            one: "Already have an account ? ", two: "Login"),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
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



Future<void> signUp(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User has been successfully signed up
    // Navigate to the new page on successful signup
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
