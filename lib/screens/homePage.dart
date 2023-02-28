import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class powerUnitsScreen extends StatefulWidget {
  const powerUnitsScreen({Key? key}) : super(key: key);

  @override
  State<powerUnitsScreen> createState() => _powerUnitsScreenState();
}

class _powerUnitsScreenState extends State<powerUnitsScreen> {
  @override
  Widget build(BuildContext context) {
    double _value = 112.0;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff0bd0a3),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 25)],
                color: Color(0xff0bd0a3),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Total energy consumed",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                AnimatedFlipCounter(
                  value: _value,
                  duration: Duration(milliseconds: 900),
                  fractionDigits: 2,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60),
                ),
                Text(
                  "Units",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 19),
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Text("Here comes car information"),
            ],
          )), // This container is for Car details or some other info like amount to be payed
        ],
      ),
    );
  }
}
