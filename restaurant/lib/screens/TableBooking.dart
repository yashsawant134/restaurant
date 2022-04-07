import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';

class TableBooking extends StatefulWidget {
  TableBooking({Key? key}) : super(key: key);

  @override
  State<TableBooking> createState() => _TpState();
}
int custNum=4;
DateTime now = DateTime.now();
String date = DateFormat('dd MMM y').format(now);
String selectedTableId = "T3";
int how_many_you_are=4;
String time_now=DateFormat.jm().format(DateTime.now());

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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("tables")
                      .snapshots(), //FirebaseFirestore.instance.collection("today_dish"),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
var tablesList=[];
                    if (snapshot.connectionState == ConnectionState.waiting && tablesList.length==0) {
                      return Center(child: CircularProgressIndicator(color: Colours.yellow),);
                    } 
                      tablesList= snapshot.data!.docs;
                      return tablesList.length>0?InteractiveViewer(
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
                                                    color: selectedTableId ==
                                                            "T1"
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
                                                tablesList[0]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          270 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T1"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                       tablesList[0]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          90 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T1"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      tablesList[0]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                      color: selectedTableId ==
                                                              "T1"
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
                                                   tablesList[0]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                          turns: new AlwaysStoppedAnimation(
                                              135 / 360),
                                          child: Column(
                                            children: [
                                              Container(
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
                                                   tablesList[1]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            270 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T2"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: selectedTableId ==
                                                                      "T2"
                                                                  ? Colours
                                                                      .yellow
                                                                      .withOpacity(
                                                                          0.3)
                                                                  : Colors
                                                                      .transparent,
                                                              spreadRadius: 1,
                                                              blurRadius: 1,
                                                              // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Image.asset(
                                                          tablesList[1]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                        color:
                                                            Color(0xff403d3d),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  RotationTransition(
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            90 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T2"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                       tablesList[1]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    new AlwaysStoppedAnimation(
                                                        180 / 360),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: selectedTableId ==
                                                                "T2"
                                                            ? Colours.yellow
                                                                .withOpacity(
                                                                    0.3)
                                                            : Colors
                                                                .transparent,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    tablesList[1]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    color: selectedTableId ==
                                                            "T3"
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
                                                tablesList[2]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          270 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T3"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                     tablesList[2]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          90 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T3"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      tablesList[2]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                      color: selectedTableId ==
                                                              "T3"
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
                                                  tablesList[2]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                          turns: new AlwaysStoppedAnimation(
                                              45 / 360),
                                          child: Column(
                                            children: [
                                              Container(
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
                                                  tablesList[3]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            270 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T4"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                        tablesList[3]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                        color:
                                                            Color(0xff403d3d),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  RotationTransition(
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            90 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T4"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                        tablesList[3]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    new AlwaysStoppedAnimation(
                                                        180 / 360),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: selectedTableId ==
                                                                "T4"
                                                            ? Colours.yellow
                                                                .withOpacity(
                                                                    0.3)
                                                            : Colors
                                                                .transparent,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    tablesList[3]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                            selectedTableId = "T5";
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T5"
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
                                                tablesList[4]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          270 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T5"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                       tablesList[4]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          90 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T5"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                       tablesList[4]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                      color: selectedTableId ==
                                                              "T5"
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
                                                   tablesList[4]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                        onTap: () {
                                          setState(() {
                                            selectedTableId = "T6";
                                          });
                                        },
                                        child: RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              135 / 360),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: selectedTableId ==
                                                              "T6"
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
                                                   tablesList[5]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            270 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T6"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                        tablesList[5]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                        color:
                                                            Color(0xff403d3d),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  RotationTransition(
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            90 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T6"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                       tablesList[5]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    new AlwaysStoppedAnimation(
                                                        180 / 360),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: selectedTableId ==
                                                                "T6"
                                                            ? Colours.yellow
                                                                .withOpacity(
                                                                    0.3)
                                                            : Colors
                                                                .transparent,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    tablesList[5]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                            selectedTableId = "T7";
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T7"
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
                                                tablesList[6]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          270 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T7"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      tablesList[6]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          90 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T7"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      tablesList[6]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                      color: selectedTableId ==
                                                              "T7"
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
                                                  tablesList[6]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                            selectedTableId = "T8";
                                          });
                                        },
                                        child: RotationTransition(
                                          turns: new AlwaysStoppedAnimation(
                                              45 / 360),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: selectedTableId ==
                                                              "T8"
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
                                                  tablesList[7]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            270 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T8"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                        tablesList[7]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                        color:
                                                            Color(0xff403d3d),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  RotationTransition(
                                                    turns:
                                                        new AlwaysStoppedAnimation(
                                                            90 / 360),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: selectedTableId ==
                                                                    "T8"
                                                                ? Colours.yellow
                                                                    .withOpacity(
                                                                        0.3)
                                                                : Colors
                                                                    .transparent,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                       tablesList[7]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                    new AlwaysStoppedAnimation(
                                                        180 / 360),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: selectedTableId ==
                                                                "T8"
                                                            ? Colours.yellow
                                                                .withOpacity(
                                                                    0.3)
                                                            : Colors
                                                                .transparent,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                   tablesList[7]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                            selectedTableId = "T9";
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: selectedTableId ==
                                                            "T9"
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
                                                tablesList[8]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          270 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T9"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      tablesList[8]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                  turns:
                                                      new AlwaysStoppedAnimation(
                                                          90 / 360),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: selectedTableId ==
                                                                  "T9"
                                                              ? Colours.yellow
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                     tablesList[8]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                                      color: selectedTableId ==
                                                              "T9"
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
                                                  tablesList[8]['isfull']?"assets/png/yellow_chair.png":"assets/png/black_chair.png",
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ):Center(child: CircularProgressIndicator(color: Colours.yellow),);
                    
                  }),
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
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
                                    time_now,
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
                            InkWell(
                              onTap:(){
                                if(custNum>1){
                                  setState(() {
                                    custNum--;
                                  });
                                  }
                              },
                              child: Container(
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
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(custNum.toString(),
                                style: GoogleFonts.davidLibre(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: (){
                                
                                  if(custNum<4){
                                    setState(() {
                                    custNum++;
                                  });}
                                  
                                
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            showCustomDialog(context);
                          },
                          child: Container(
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



  void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 240,
          
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colours.lightdark, borderRadius: BorderRadius.circular(40)),
          child: Container(
            width: 380,
            height: 270,
            child: Stack(
              
              children: [

                Positioned( top:15,left: 0,
                right: 0,child: Column(
                  children: [
                    Icon(Icons.calendar_month_rounded,color:Colours.yellow,size:80),
                    SizedBox(height: 8,),
                    Text("Are you sure",style:TextStyle(decoration: TextDecoration.none,color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Text(date +" "+time_now,style:TextStyle(decoration: TextDecoration.none,color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)
                  ],
                )),

                Positioned(bottom:0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                     FirebaseFirestore.instance.collection("booked_table").doc(Custtoken).set({
                      'date':date,
                      'name':Custname,
                      'num_of_people':custNum,
                      'table_id':selectedTableId,
                      'time':time_now,
                      'token':Custtoken
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical:10),
                    width: 290,
                    height: 50,
                    decoration: BoxDecoration(color: Colours.yellow, borderRadius: BorderRadius.circular(20)),
                  
                    child: Center(child: Text("Yes Book",style:TextStyle(decoration: TextDecoration.none,color: Colours.dark,fontSize: 21,fontWeight: FontWeight.bold),)),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }
  
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
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
      isForce2Digits: false,
      secondsInterval: 1,
      onTimeChange: (time) {
        setState(() {
            time_now=time.toString().substring(11,16);
        });
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
