import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:blue/screens/loginPage.dart';
import 'package:blue/services/firebase_auth.dart';
import 'package:blue/services/realtimeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/show_snack_bar.dart';

class powerUnitScreen extends StatefulWidget {
  const powerUnitScreen({Key? key}) : super(key: key);

  @override
  State<powerUnitScreen> createState() => _powerUnitScreenState();
}

class _powerUnitScreenState extends State<powerUnitScreen> {
  // get realValue => stream;
  var unitsValue = 9;
  var unitConsumed = 200;
  var unitCharge = 8;
  var serviceCharge = 5;
  var totalCost;

  String receiverUpiId = "9023445258@paytm";
  String receiverName = "Adarsh Verma";
  String transactionNote = "Test Payment";
  var transactionAmount = '10.00';
  // String transactionAmountStr = '10.00';
  String transactionRefId = "TRAN001";
  String currency = "INR";
  String upiUrl = 'www.google.com';

  @override
  void initState() {
    stream.listen((event) {
      setState(() {
        unitsValue = int.parse(event.snapshot.value.toString());
        unitConsumed = int.parse(event.snapshot.value.toString());
        totalCost = unitConsumed * unitCharge + serviceCharge;
        transactionAmount = totalCost.toString();
      });
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    transactionAmount = totalCost.toString();
    upiUrl = "upi://pay?pa=" +
        receiverUpiId +
        "&pn=" +
        receiverName +
        "&tn=" +
        transactionNote +
        "&am=" +
        transactionAmount +
        "&tr=" +
        transactionRefId +
        "&cu=" +
        currency;
    print(transactionAmount);
  }

  @override
  Widget build(BuildContext context) {
    bool isOn = false;

    FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(children: [
          Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 24,
          ),
          Spacer(),
          IconButton(
              onPressed: () async {
                methods.signOut(context);
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => loginPage()));
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
                size: 26,
              )),
        ]),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 56),
              const CircleAvatar(
                foregroundColor: Colors.blue,
                backgroundImage: AssetImage('asset/adarshpic.jpg'),
                radius: 35,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Adarsh Verma", // Name of charging station
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "adarsh.upi.id",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 52,
              ),
              const Text(
                "UNITS CONSUMED",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              AnimatedFlipCounter(
                value: unitsValue,
                fractionDigits: 2,
                duration: const Duration(milliseconds: 500),
                textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),

              ToggleSwitch(
                minWidth: 200.0,
                minHeight: 50,
                initialLabelIndex: 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['Start Charging', 'Stop Charging'],
                icons: [Icons.battery_charging_full_sharp, Icons.battery_0_bar],
                activeBgColors: [
                  [Color(0xFF0BD0A3)],
                  [Colors.red]
                ],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),

              // InkWell(
              //   onTap: setState({isOn = !isOn}),
              //   child: SizedBox(
              //       height: 50,
              //       width: 200,
              //       child: Container(
              //           decoration: BoxDecoration(
              //               color: isOn ? Color(0xFF0BD0A3) : Colors.red),
              //           // _isOn ? Color(0xFF0BD0A3) : Colors.red),
              //           child: Text(
              //             (isOn == false) ? "CHARGE" : "NOT",
              //             style: TextStyle(fontSize: 18),
              //           ))),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.5,

                  // constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 12)]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: const [
                                SizedBox(width: 15),
                                Text(
                                  "Amount Due",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Total units consumed",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5C5C5C)),
                                ),
                                const Spacer(),
                                Text(unitConsumed
                                    .toString()), // This value to be updated real-time
                              ],
                            ),
                          ),
                          SizedBox(height: 3),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                SizedBox(width: 14),
                                const Text(
                                  "per unit charge",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF5C5C5C)),
                                ),
                                const Spacer(),
                                Text(unitCharge
                                    .toString()) //This value will be updated from firebase
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                const Text(
                                  "Service Charge",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5C5C5C)),
                                ),
                                const Spacer(),
                                Text(serviceCharge
                                    .toString()) //This value will be updated from firebase
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 1.119,
                          //   height: 1,
                          //   color: Colors.black87,
                          // ),

                          const Divider(
                            color: Color(0xFF5C5C5C),
                            height: 5,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                const Text(
                                  "Total Amount",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                const Spacer(),
                                Text(
                                  (totalCost).toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          // Spacer(
                          //   flex: 1,
                          // ),

                          ElevatedButton(
                            onPressed: () async {
                              if (await canLaunch(upiUrl)) {
                                await launch(upiUrl);
                              }
                            },
                            child: const Text(
                              "Continue to pay",
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0BD0A3),
                                shadowColor: Colors.greenAccent,
                                elevation: 5,
                                minimumSize: const Size(280, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signOut() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
