import 'package:blue/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/show_snack_bar.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final forgotPasswordEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87, size: 35),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),
              Image.asset(
                'asset/forgotpass.png',
                scale: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "Forgot",
                      style: TextStyle(
                        fontFamily: 'Fred',
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "Password?",
                      style: TextStyle(
                        fontFamily: 'Fred',
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  child: Text(
                      "Don't worry it happens. Please enter the address associated with your account",
                      style: TextStyle(fontSize: 15, color: Colors.black45)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(10)),
                width: (MediaQuery.of(context).size.width) * 0.85,
                child: TextField(
                  controller: forgotPasswordEmailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email ID",
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      size: 30,
                      color: Color(0xFF0BD0A3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.7,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: forgotPasswordEmailController.text.trim());
                      } on FirebaseAuthException catch (e) {
                        showSnackBar(context, e.message!);
                      }
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0BD0A3)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
