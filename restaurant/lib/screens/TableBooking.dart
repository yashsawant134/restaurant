import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';

class TableBooking extends StatefulWidget {
  TableBooking({Key? key}) : super(key: key);

  @override
  State<TableBooking> createState() => _TpState();
}

DateTime now = DateTime.now();
String date = DateFormat('dd MMM y').format(now);
String selectedTableId = "T3";

class _TpState extends State<TableBooking> {
  final _transformationController = TransformationController();
  @override
  void initState() {
    _transformationController.value = Matrix4.identity()..scale(2.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.dark,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              InteractiveViewer(
                maxScale: 2.5,
                transformationController: _transformationController,
                panEnabled: true,
                constrained: true,
                scaleEnabled: false,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bg.png"),
                            fit: BoxFit.cover,
                            opacity: 1),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTableId = "T1";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId == "T1"
                                                ? Colours.yellow
                                                    .withOpacity(0.3)
                                                : Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              270 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T1"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff403d3d),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              90 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T1"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedTableId == "T1"
                                                  ? Colours.yellow
                                                      .withOpacity(0.3)
                                                  : Colors.transparent,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/png/yellow_chair.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          //----------------------------------Row 1 end ------------------------------------//
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTableId = "T2";
                                  });
                                },
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(135 / 360),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedTableId == "T2"
                                                  ? Colours.yellow
                                                      .withOpacity(0.3)
                                                  : Colors.transparent,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/png/yellow_chair.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                270 / 360),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T2"
                                                        ? Colours.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.transparent,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: selectedTableId ==
                                                              "T2"
                                                          ? Colours.yellow
                                                              .withOpacity(0.3)
                                                          : Colors.transparent,
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  "assets/png/yellow_chair.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          ClipOval(
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff403d3d),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                90 / 360),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T2"
                                                        ? Colours.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.transparent,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/png/yellow_chair.png",
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: selectedTableId == "T2"
                                                    ? Colours.yellow
                                                        .withOpacity(0.3)
                                                    : Colors.transparent,
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTableId = "T3";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId == "T3"
                                                ? Colours.yellow
                                                    .withOpacity(0.3)
                                                : Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              270 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T3"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff403d3d),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              90 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T3"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedTableId == "T3"
                                                  ? Colours.yellow
                                                      .withOpacity(0.3)
                                                  : Colors.transparent,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/png/black_chair.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTableId = "T4";
                                  });
                                },
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(45 / 360),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedTableId == "T4"
                                                  ? Colours.yellow
                                                      .withOpacity(0.3)
                                                  : Colors.transparent,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/png/black_chair.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                270 / 360),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T4"
                                                        ? Colours.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.transparent,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/png/black_chair.png",
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          ClipOval(
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff403d3d),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                90 / 360),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T4"
                                                        ? Colours.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.transparent,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/png/black_chair.png",
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: selectedTableId == "T4"
                                                    ? Colours.yellow
                                                        .withOpacity(0.3)
                                                    : Colors.transparent,
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            "assets/png/black_chair.png",
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  
                                  setState(() {
                                    selectedTableId="T5";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId == "T5"
                                                ? Colours.yellow.withOpacity(0.3)
                                                : Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              270 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T5"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff403d3d),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              90 / 360),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: selectedTableId == "T5"
                                                      ? Colours.yellow
                                                          .withOpacity(0.3)
                                                      : Colors.transparent,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedTableId == "T5"
                                                  ? Colours.yellow
                                                      .withOpacity(0.3)
                                                  : Colors.transparent,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "assets/png/yellow_chair.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                onTap:(){
                                  setState((){
                                      selectedTableId="T6";
                                  });
                                },
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(135 / 360),
                                  child: Column(
                                    children: [
                                      Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T6"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RotationTransition(
                                              turns: new AlwaysStoppedAnimation(
                                                  270 / 360),
                                              child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T6"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          ClipOval(
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff403d3d),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          RotationTransition(
                                              turns: new AlwaysStoppedAnimation(
                                                  90 / 360),
                                              child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T6"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              180 / 360),
                                          child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T6"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedTableId="T7";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T7"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                270 / 360),
                                            child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T7"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff403d3d),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                90 / 360),
                                            child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T7"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns:
                                            new AlwaysStoppedAnimation(180 / 360),
                                        child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T7"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedTableId="T8";
                                  });
                                },
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(45 / 360),
                                  child: Column(
                                    children: [
                                      Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T8"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RotationTransition(
                                              turns: new AlwaysStoppedAnimation(
                                                  270 / 360),
                                              child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T8"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          ClipOval(
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff403d3d),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          RotationTransition(
                                              turns: new AlwaysStoppedAnimation(
                                                  90 / 360),
                                              child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T8"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              180 / 360),
                                          child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T8"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTableId="T9";
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T9"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                270 / 360),
                                            child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T9"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff403d3d),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RotationTransition(
                                            turns: new AlwaysStoppedAnimation(
                                                90 / 360),
                                            child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T9"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns:
                                            new AlwaysStoppedAnimation(180 / 360),
                                        child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: selectedTableId=="T9"? Colours.yellow.withOpacity(0.3): Colors.transparent,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.arrow_back,
                      //         color: Colors.white,
                      //         size: 28,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.qr_code_scanner_rounded,
                      //         color: Colors.white,
                      //         size: 28,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Toyo Eatery",
                        style: GoogleFonts.davidLibre(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                color: Colors.white.withOpacity(0.18),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "Grand atrium",
                                style: GoogleFonts.davidLibre(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 110,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[700],
                            ),
                            child: Center(
                              child: Text(
                                "Outside",
                                style: GoogleFonts.davidLibre(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 245,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colours.lightdark,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Schedule a visit",
                            style: GoogleFonts.davidLibre(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: showCalendar,
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.yellow.shade400),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Text(
                                    date,
                                    style: GoogleFonts.davidLibre(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: ShowTime,
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey[700],
                                ),
                                child: Center(
                                  child: Text(
                                    "8PM",
                                    style: GoogleFonts.davidLibre(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("How many you are?",
                                style: GoogleFonts.davidLibre(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade400),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: new Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("04",
                                style: GoogleFonts.davidLibre(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade400),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colours.yellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            "Book a table",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
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

  void showCalendar() {
    showAdaptiveActionSheet(
      context: context,
      title: const Text(
        'Choose preferable date',
        style: TextStyle(color: Colors.yellow),
      ),
      androidBorderRadius: 30,
      bottomSheetColor: Colours.lightdark,
      actions: [
        BottomSheetAction(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DatePicker(
                  DateTime.now(),
                  daysCount: 10,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.yellow,
                  selectedTextColor: Colours.dark,
                  onDateChange: (dat) {
                    // New date selected
                    setState(() {
                      date = dat.day.toString() +
                          " " +
                          dat.month.toString() +
                          " " +
                          dat.year.toString();
                    });
                  },
                ),
              ],
            ),
            onPressed: () {}),
      ],
      cancelAction: CancelAction(
          title: const Text(
              'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  buildCustomTimer(BuildContext context) {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 24, color: Colours.icon_color),
      highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 20,
      itemHeight: 50,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {});
      },
    );
  }

  void ShowTime() {
    showAdaptiveActionSheet(
      context: context,
      title: const Text(
        'Choose preferable time',
        style: TextStyle(color: Colors.yellow),
      ),
      androidBorderRadius: 30,
      bottomSheetColor: Colours.lightdark,
      actions: [
        BottomSheetAction(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[buildCustomTimer(context)],
            ),
            onPressed: () {}),
      ],
      cancelAction: CancelAction(
          title: const Text(
              'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}
