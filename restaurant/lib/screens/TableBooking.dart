
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableBooking extends StatefulWidget {
  TableBooking({Key? key}) : super(key: key);

  @override
  State<TableBooking> createState() => _TpState();
}

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
        backgroundColor: Colors.black,
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
                    RotationTransition(
                      turns: new AlwaysStoppedAnimation(15 / 360),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/bg.jpg"),
                              fit: BoxFit.cover,
                              opacity: 0.4),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/png/yellow_chair.png",
                                    width: 24,
                                    height: 24,
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
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
                              RotationTransition(
                                turns: new AlwaysStoppedAnimation(135 / 360),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/png/yellow_chair.png",
                                      width: 24,
                                      height: 24,
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
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
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
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Image.asset(
                                          "assets/png/yellow_chair.png",
                                          width: 24,
                                          height: 24,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/png/black_chair.png",
                                    width: 24,
                                    height: 24,
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
                                          child: Image.asset(
                                            "assets/png/black_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
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
                                          child: Image.asset(
                                            "assets/png/black_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RotationTransition(
                                turns: new AlwaysStoppedAnimation(45 / 360),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/png/black_chair.png",
                                      width: 24,
                                      height: 24,
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
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
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
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Image.asset(
                                          "assets/png/black_chair.png",
                                          width: 24,
                                          height: 24,
                                        )),
                                  ],
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
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/png/yellow_chair.png",
                                    width: 24,
                                    height: 24,
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
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
                              RotationTransition(
                                turns: new AlwaysStoppedAnimation(135 / 360),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/png/black_chair.png",
                                      width: 24,
                                      height: 24,
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
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
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
                                            child: Image.asset(
                                              "assets/png/black_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Image.asset(
                                          "assets/png/black_chair.png",
                                          width: 24,
                                          height: 24,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/png/black_chair.png",
                                    width: 24,
                                    height: 24,
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
                                          child: Image.asset(
                                            "assets/png/black_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
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
                                          child: Image.asset(
                                            "assets/png/black_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Image.asset(
                                        "assets/png/black_chair.png",
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RotationTransition(
                                turns: new AlwaysStoppedAnimation(45 / 360),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/png/yellow_chair.png",
                                      width: 24,
                                      height: 24,
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
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
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
                                            child: Image.asset(
                                              "assets/png/yellow_chair.png",
                                              width: 24,
                                              height: 24,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RotationTransition(
                                        turns: new AlwaysStoppedAnimation(
                                            180 / 360),
                                        child: Image.asset(
                                          "assets/png/yellow_chair.png",
                                          width: 24,
                                          height: 24,
                                        )),
                                  ],
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
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/png/yellow_chair.png",
                                    width: 24,
                                    height: 24,
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
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
                                          child: Image.asset(
                                            "assets/png/yellow_chair.png",
                                            width: 24,
                                            height: 24,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: Image.asset(
                                        "assets/png/yellow_chair.png",
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
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
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Color(0xff544f4f)),
          child: Container(
            margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade400),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "02 FEB 2022",
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
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[700],
                      ),
                      child: Center(
                        child: Text(
                          "8PM",
                          style: GoogleFonts.davidLibre(
                              color: Colors.white, fontSize: 18),
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
                        border: Border.all(color: Colors.yellow.shade400),
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
                        border: Border.all(color: Colors.yellow.shade400),
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
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
    );
  }
}
