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
    double _value = 5000.0;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff0bd0a3),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 25)],
                color: Color(0xff0bd0a3),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tilt'),
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedFlipCounter(
                  value: _value,
                  duration: const Duration(milliseconds: 1000),
                  fractionDigits: 2,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Units",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Amount to be paid ",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontFamily: 'Tilt'),
                    )),
              ),
              const SizedBox(height: 60),
              const AnimatedFlipCounter(
                prefix: '₹',
                value: 20,
                duration: Duration(milliseconds: 1000),
                textStyle: TextStyle(
                    color: Color(0xff0bd0a3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 290),
              ElevatedButton(
                  onPressed: () {
                    print("Payment button pressed");
                  },
                  child: const Text(
                    "   Proceed to Pay   ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0bd0a3)))
            ],
          ), // This container is for Car details or some other info like amount to be payed
        ],
      ),
    );
  }
}
