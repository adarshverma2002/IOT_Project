import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:blue/services/realtimeData.dart';
import 'package:flutter/material.dart';

class powerUnitScreen extends StatefulWidget {
  const powerUnitScreen({Key? key}) : super(key: key);

  @override
  State<powerUnitScreen> createState() => _powerUnitScreenState();
}

class _powerUnitScreenState extends State<powerUnitScreen> {
  // get realValue => stream;
  var unitsValue = 5;
  var unitPrice = 6;
  var unitCharge = 8;
  var serviceCharge = 0;

  @override
  void initState() {
    stream.listen((event) {
      setState(() {
        unitsValue = int.parse(event.snapshot.value.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              color: Colors.black87,
              size: 24,
            )
          ],
        ),
      ),
      body: Container(
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
                height: 120,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,

                  // constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 12)]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
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
                                  "Total unit price",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5C5C5C)),
                                ),
                                const Spacer(),
                                Text(unitPrice
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
                                const Text(
                                    "10.00") //This value will be updated from firebase
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
                                  (unitPrice + unitCharge + serviceCharge)
                                      .toString(),
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
                            onPressed: () {
                              print("payment button pressed");
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
}
