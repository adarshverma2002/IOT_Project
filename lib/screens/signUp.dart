import 'package:blue/screens/homePage.dart';
import 'package:blue/screens/loginPage.dart';
import 'package:blue/utils/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('asset/scooter.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create a new account",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fred',
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please put your information below to create a new account for using the app",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 14, wordSpacing: 0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.key)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextFormField(
                      validator: (val) {
                        if (val == null) {
                          return "Enter Password";
                        }
                        if (val != passwordController.text) {
                          return "Enter same password";
                        }
                        return null;
                      },
                      controller: confPasswordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm password",
                          prefixIcon: Icon(Icons.email)),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (passwordController.text !=
                                confPasswordController.text) {
                              showSnackBar(context, "Passwords do not match",
                                  Colors.red);
                            } else {
                              signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0BD0A3)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.w300,
                              // color: Colors.black54
                            ),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => loginPage()));
                          },
                          child: Text(
                            "Join now",
                            style: TextStyle(color: Color(0xFF0BD0A3)),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (builder) => powerUnitScreen()),
        (route) => false);
  }
}
