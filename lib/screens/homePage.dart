import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class powerUnitScreen extends StatefulWidget {
  const powerUnitScreen({Key? key}) : super(key: key);

  @override
  State<powerUnitScreen> createState() => _powerUnitScreenState();
}

class _powerUnitScreenState extends State<powerUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
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
              SizedBox(height: 56),
              CircleAvatar(
                foregroundColor: Colors.blue,
                backgroundImage: AssetImage('asset/adarshpic.jpg'),
                radius: 35,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Adarsh Verma", // Name of charging station
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "adarsh.upi.id",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 52,
              ),
              Text(
                "UNITS CONSUMED",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 7,
              ),
              AnimatedFlipCounter(
                value: 1300,
                fractionDigits: 2,
                duration: Duration(milliseconds: 500),
                textStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 120,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,

                  // constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
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
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
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
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Total unit price",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5C5C5C)),
                                ),
                                Spacer(),
                                Text(
                                  "200.00",
                                ), // This value to be updated real-time
                              ],
                            ),
                          ),

                          // Row(
                          //   children: [],
                          // ),// change per unit charge

                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Service Charge",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5C5C5C)),
                                ),
                                Spacer(),
                                Text(
                                    "10.00") //This value will be updated from firebase
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 1.119,
                          //   height: 1,
                          //   color: Colors.black87,
                          // ),

                          Divider(
                            color: Color(0xFF5C5C5C),
                            height: 5,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Spacer(),
                                Text(
                                  "210.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          // Spacer(
                          //   flex: 1,
                          // ),

                          ElevatedButton(
                            onPressed: () {
                              print("payment button pressed");
                            },
                            child: Text(
                              "Continue to pay",
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0BD0A3),
                                shadowColor: Colors.greenAccent,
                                elevation: 5,
                                minimumSize: Size(280, 40),
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
