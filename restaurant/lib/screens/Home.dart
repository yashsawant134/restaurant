import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:restaurant/Constants/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selecind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightdark,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: new Image.asset(
                  "assets/png/bell.png",
                  height: 30,
                  width: 30,
                  color: Colours.yellow,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {},
                icon: new Image.asset(
                  "assets/png/shoppingcart.png",
                  height: 30,
                  width: 30,
                  color: Colours.yellow,
                )),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.let_eat,
                    style: GoogleFonts.davidLibre(
                        fontSize: 45,
                        color: Colours.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    Strings.nutrious_food,
                    style: GoogleFonts.davidLibre(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 7,
                    child: NavigationRail(
                      backgroundColor: Colors.transparent,
                      selectedIndex: selecind,
                      onDestinationSelected: (int index) {
                        setState(() {
                          selecind = index;
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      selectedLabelTextStyle: GoogleFonts.davidLibre(
                          color: Colours.yellow,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      unselectedLabelTextStyle: GoogleFonts.davidLibre(
                          color: Colours.icon_color,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                      destinations: const [
                        NavigationRailDestination(
                          icon: SizedBox.shrink(),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                "Desert",
                              ),
                            ),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: SizedBox.shrink(),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                "Main Course",
                              ),
                            ),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: SizedBox.shrink(),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                "Break Fast",
                              ),
                            ),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: SizedBox.shrink(),
                          label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                "Lunch",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width / 7) -
                        10,
                    child: CarouselSlider(
                      
                      options: CarouselOptions(height: 500.0,
                            enlargeCenterPage: true,
                            reverse: false),
                      items: [1, 2, 3, 4, 5,6].map((i) {
                        int inde=i;
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              width: 290,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: inde%2==0?Color(0xffebd96a):Colours.icon_color,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/desert1.jpg",
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "Desert",
                                      style: GoogleFonts.lato(
                                          fontSize: 28,
                                          color: Colours.dark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      width: 110,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1))),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Food Plate",
                                      style: GoogleFonts.lato(
                                          fontSize: 24,
                                          color: Colours.dark,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(height: 40),
                                    Text(
                                      "A unique experience of tase and delicious incgridents prepared for you with step by step instruction",
                                      style: GoogleFonts.lato(
                                          fontSize: 19,
                                          color: Colours.dark,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
