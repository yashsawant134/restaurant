import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
//import 'package:translator/translator.dart';

// final translator = GoogleTranslator();
// final String whynot = translateApp().toString();

// Future<String> translateApp() async {
//   Translation translatedText =
//       await translator.translate("hello", from: "English", to: "Hindi");
//   return translatedText.text;
// }

String? code_all = "";
var weekday = [
  'Monday',
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];
var dishData = [];

var today = DateFormat('EEEE').format(DateTime.now()); //Tuesday
Stream<QuerySnapshot<Object?>> special_all = Stream.empty();
Stream<QuerySnapshot<Object?>> resto_all = Stream.empty();

class MenuScreen extends StatefulWidget {
  String? code = '';
  Stream<QuerySnapshot<Object?>> special = Stream.empty();
  Stream<QuerySnapshot<Object?>> resto = Stream.empty();

  MenuScreen(
      {Key? key,
      required this.code,
      required this.special,
      required this.resto})
      : super(key: key) {
    code_all = this.code;
    special_all = this.special;
    resto_all = this.resto;
    //firebaseAppfunc();
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

//Firebase initialization
// Future<void> firebaseAppfunc() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

class _MenuScreenState extends State<MenuScreen> {
  int current = 0;
  void changeCurrent(int n) {
    setState(() {
      current = n;
    });
  }

  final Stream<QuerySnapshot> special =
      FirebaseFirestore.instance.collection("today_dish").snapshots();

  final Stream<QuerySnapshot> resto =
      FirebaseFirestore.instance.collection("resto_menu").snapshots();
  String today_dish_name = "";
  String today_dish_price = "";
  String name = "";
  String price = "";
  String type = "";
  String image = "";
  final List mnames = [];
  final List mprices = [];
  final List mtypes = [];
  final List mimages = [];
  final List menu_data = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: resto_all,
        builder:
            (BuildContext context1, AsyncSnapshot<QuerySnapshot> snapshot1) {
          return StreamBuilder<QuerySnapshot>(
              stream: special_all,
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasError && snapshot1.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot1.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                } else {
                  final data = snapshot.data!.docs;
                  final data1 = snapshot1.data!.docs;
                  // int todayIndex = weekday.indexOf(today);
                  // today_dish_name = data[todayIndex]['name'];
                  String img = "";
                  for (int i = 0; i < data.length; i++) {
                    if (data[i].id == today) {
                      today_dish_name = data[i]['name'];
                      today_dish_price = data[i]['price'];
                      img = data[i]['imgURL'];
                    }
                  }

                  for (int i = 0; i < data1.length; i++) {
                    mimages.add(data1[i]['img']);
                    mnames.add(data1[i]['name']);
                    mprices.add(data1[i]['price']);

                    //mtypes.add(data1[i]['type']);
                  }
                  menu_data.addAll(mimages);
                  menu_data.addAll(mnames);
                  menu_data.addAll(mprices);

                  //menu_data.addAll(mtypes);

                  return Scaffold(
                    backgroundColor: Colours.lightdark,
                    appBar: AppBar(
                      title: Text(code_all!),
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
                    body: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Hits of the Day",
                            style: GoogleFonts.davidLibre(
                                fontSize: 27,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 260,
                            child: Stack(children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 210,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colours.dark,
                                              blurRadius: 10.0,
                                              spreadRadius: 5),
                                        ],
                                        gradient: LinearGradient(
                                            colors: [
                                              const Color(0xFF87c6fe),
                                              Colors.white,
                                            ],
                                            begin: Alignment(-1.0, -4.0),
                                            end: Alignment(1.0, 4.0),
                                            stops: [0.3, 1],
                                            tileMode: TileMode.clamp),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(28))),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                        img,
                                        width: 190,
                                        height: 190,
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              today_dish_name,
                                              style: GoogleFonts.davidLibre(
                                                  fontSize: 21,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                color: Colours.dark,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  today_dish_price,
                                                  style: GoogleFonts.davidLibre(
                                                      fontSize: 21,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                            ])),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 43,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: categoriesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: CategoriesList(
                                      index: index,
                                      selectedIndex: current,
                                    ));
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("resto_menu")
                                  .snapshots(), //FirebaseFirestore.instance.collection("today_dish"),
                              builder: (
                                BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot,
                              ) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                        ConnectionState.waiting &&
                                    dishData.length == 0) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                        color: Colours.yellow),
                                  );
                                }
                                var dishList = snapshot.data!.docs;
                                for (int i = 0; i < dishList.length; i++) {
                                  if (categoriesList[current].name ==
                                      dishList[i]['type']){dishData.add(dishList[i]);}
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: dishData.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        onTap: () {
                                          showDetails();
                                        },
                                        child: showMenu(
                                          index: index,
                                        ));
                                  },
                                );
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colours.yellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Row(
                            children: [
                              SimpleShadow(
                                child: Image.asset(
                                  "assets/png/foodplate.png",
                                  width: 170,
                                  height: 170,
                                ),
                                opacity: 0.6, // Default: 0.5
                                color: Colors.black, // Default: Black
                                offset: Offset(5, 5), // Default: Offset(2, 2)
                                sigma: 7, // Default: 2
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.1,
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Salad with Radishes tomatoes and mushroom",
                                            style: TextStyle(
                                                color: Colours.dark,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colours.lightdark,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Rs 99",
                                              style: GoogleFonts.davidLibre(
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "325 kcal",
                                          style: TextStyle(
                                              color: Colours.icon_color,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //
                      ],
                    ),
                  );
                }
              });
        });
  }

  void showDetails() {
    showAdaptiveActionSheet(
      context: context,
      androidBorderRadius: 30,
      bottomSheetColor: Colours.lightdark,
      actions: [
        BottomSheetAction(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SimpleShadow(
                            child: Image.asset(
                              "assets/png/foodplate.png",
                              width: 300,
                              height: 300,
                            ),
                            opacity: 0.6, // Default: 0.5
                            color: Colors.black, // Default: Black
                            offset: Offset(5, 5), // Default: Offset(2, 2)
                            sigma: 7, // Default: 2
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Salad with Radishes tomatoes and mushroom",
                                        style: GoogleFonts.lato(
                                            color: Colours.yellow,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Salad with Radishes tomatoes and mushroom Salad with Radishes tomatoes and mushroom Salad with Radishes tomatoes and mushroom Salad with Radishes tomatoes and mushroom",
                                        style: GoogleFonts.lato(
                                            color: Colours.icon_color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colours.icon_color,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colours.dark,
                                                blurRadius: 5.0,
                                                spreadRadius: 3),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            size: 30,
                                          ),
                                          Text(
                                            "1",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colours.yellow,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colours.dark,
                                                blurRadius: 3.0,
                                                spreadRadius: 3),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Add to cart",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "Rs 99",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            onPressed: () {}),
      ],
    );
  }
}

class CategoryModel {
  String? icon;
  String? name;

  CategoryModel({required this.icon, required this.name});
}

List<CategoryModel> categoriesList = categoryData
    .map(
      (item) => CategoryModel(icon: item['icon'], name: item['name']),
    )
    .toList();

var categoryData = [
  {
    "icon": "assets/png/alopathy.png",
    "name": "Burger",
  },
  {
    "icon": "assets/png/ayurvedic.png",
    "name": "Pizza",
  },
  {"icon": "assets/png/homeo.png", "name": "Pasta"},
  {"icon": "assets/png/homeo.png", "name": "Chineese"},
  {"icon": "assets/png/homeo.png", "name": "Desserts"}
];

class CategoriesList extends StatefulWidget {
  int index, selectedIndex;

  CategoriesList({
    Key? key,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, left: 10),
        width: 105,
        decoration: BoxDecoration(
            gradient: widget.index==widget.selectedIndex
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colours.yellow, Colours.yellow])
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colours.icon_color, Colours.icon_color]),
            border: Border.all(
                color: widget.index==widget.selectedIndex ? Colours.dark : Colours.lightdark),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 3,
              ),
              Text(
                categoriesList[widget.index].name!,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: widget.index==widget.selectedIndex? Colours.dark : Colours.dark),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class showMenu extends StatefulWidget {
  int index;
  showMenu({Key? key, required this.index}) : super(key: key);

  @override
  State<showMenu> createState() => _showMenuState();
}

class _showMenuState extends State<showMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      height:
          150, //[{img:"    ",name:"yash"},{img:"    ",name:"yash"},{img:"    ",name:"yash"},{img:"    ",name:"yash"}]
      decoration: BoxDecoration(
          color: Colours.yellow,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Row(
        children: [
          SimpleShadow(
            child: Image.network(
              dishData[widget.index]['img'],
              width: 170,
              height: 170,
            ),
            opacity: 0.6, // Default: 0.5
            color: Colors.black, // Default: Black
            offset: Offset(5, 5), // Default: Offset(2, 2)
            sigma: 7, // Default: 2
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 150,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dishData[widget.index]['name'],
                          style: TextStyle(
                              color: Colours.dark,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colours.lightdark,
                        ),
                        child: Center(
                          child: Text(
                            dishData[widget.index]['price'],
                            style: GoogleFonts.davidLibre(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "325 kcal",
                        style: TextStyle(
                            color: Colours.icon_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
