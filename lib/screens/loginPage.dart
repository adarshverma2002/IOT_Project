import 'package:blue/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _loading = false;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/evcar.png",
                    scale: 4,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "WeCharge",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Fred'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Sign In to Continue",
                style: TextStyle(
                    color: Colors.black54, fontFamily: 'Tilt', fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black87,
                        size: 30,
                      ),
                      hintText: "Username"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                // height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.black87,
                        size: 30,
                      ),
                      hintText: "Password"),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    methods.loginWithEmail(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0BD0A3)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xFF0BD0A3)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
