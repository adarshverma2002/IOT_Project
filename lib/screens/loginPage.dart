import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("asset/iot3.jpeg"),
        fit: BoxFit.cover,
        opacity: 0.5,
      )),
      child: Column(
        children: <Widget>[
          SizedBox(height: 120),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'IOT Project',
                style: TextStyle(
                    color: Color(0xFF01303f),
                    fontWeight: FontWeight.w500,
                    fontSize: 48),
              )),
          SizedBox(height: 60),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF01303f)),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.green,
                primaryColorDark: Colors.pink,
              ),
              child: TextField(
                // controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Color(0xFF01303f))),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              // controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            style: TextButton.styleFrom(foregroundColor: Color(0xFF01303f)),
            child: const Text(
              'Forgot Password',
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0bd0a3)),
                child: const Text('Login'),
                onPressed: () {
                  // print(nameController.text);
                  // print(passwordController.text);
                },
              )),
          Row(
            children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 15, color: Color(0xFF01303f)),
                ),
                onPressed: () {
                  //signup screen
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
