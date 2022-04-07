import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

Map<String, int> cartListMap = new Map();
var today = DateFormat('EEEE').format(DateTime.now()); //Tuesday
Stream<QuerySnapshot<Object?>> special_all = Stream.empty();
var menuList = [];
bool haveOrder=false;
class MenuScreen extends StatefulWidget {
  String? code = '';
  Stream<QuerySnapshot<Object?>> special = Stream.empty();

  MenuScreen({Key? key, required this.code, required this.special})
      : super(key: key) {
    code_all = this.code;
    special_all = this.special;
    //firebaseAppfunc();
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

var cartList = [];

class _MenuScreenState extends State<MenuScreen> {
  int current = 0;
  void changeCurrent(int n) {
    setState(() {
      current = n;
    });
    // Fluttertoast.showToast(
    //   msg: "try: " + code_all!, // message
    //   toastLength: Toast.LENGTH_SHORT, // length
    //   gravity: ToastGravity.CENTER, // location
    // );
  }

  final Stream<QuerySnapshot> special =
      FirebaseFirestore.instance.collection("today_dish").snapshots();
  String today_dish_name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightdark,
      appBar: AppBar(
        title: Text(
          code_all!,
          style: TextStyle(color: Colours.yellow),
        ),
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
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Hits of the week",
                  style: GoogleFonts.davidLibre(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28))),
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
                              child: StreamBuilder<QuerySnapshot>(
                                  stream:
                                      special_all, //FirebaseFirestore.instance.collection("today_dish"),
                                  builder: (
                                    BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot,
                                  ) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }
                                    final data = snapshot.data!.docs;
                                    int todayIndex = weekday.indexOf(today);
                                    today_dish_name = data[todayIndex]['name'];
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    } else {
                                      String img = "";
                                      for (int i = 0; i < data.length; i++) {
                                        if (data[i].id == today) {
                                          img = data[i]['imgURL'];
                                        }
                                      }

                                      return Image.network(
                                        img,
                                        width: 190,
                                        height: 190,
                                      );
                                    }
                                  })),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "Rs 99",
                                      style: GoogleFonts.davidLibre(
                                          fontSize: 21,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                      return CategoriesList(
                        index: index,
                        isSelected: current == index,
                        changeCurrent: changeCurrent,
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("resto_menu")
                      .snapshots(),
                  builder: (context, productsnapshot) {
                    if (productsnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var menu = productsnapshot.data!.docs;
                    menuList.clear();
                    for (int i = 0; i < menu.length; i++) {
                      if (menu[i]['type'] == categoriesList[current].name) {
                        menuList.add(menu[i]);
                      }
                    }
                    return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: menuList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Slidable(
                            key: UniqueKey(),
                            startActionPane: ActionPane(
                              key: UniqueKey(),
                              // dismissible: DismissiblePane(onDismissed: () {}),
                              dismissible: DismissiblePane(onDismissed: () {
                                setState(() {
                                  cartList.add(menuList[index]);
                                  if (!cartListMap
                                      .containsKey(menuList[index]['img'])) {
                                    cartListMap[menuList[index]['img']] = 1;
                                  } else {
                                    cartListMap.update(menuList[index]['img'],
                                        (value) => value + 1);
                                  }
                                  
                                });
                              }),
                              motion: BehindMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.

                                  flex: 2,
                                  onPressed: null,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colours.yellow,
                                  icon: Icons.shopping_bag,
                                  label: 'Add',
                                ),
                              ],
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 7, left: 12, right: 12),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colours.dark,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Row(
                                children: [
                                  SimpleShadow(
                                    child: Image.network(
                                      menuList[index]['img'],
                                      width: 170,
                                      height: 170,
                                    ),
                                    opacity: 0.6, // Default: 0.5
                                    color: Colors.black, // Default: Black
                                    offset:
                                        Offset(5, 5), // Default: Offset(2, 2)
                                    sigma: 7, // Default: 2
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    height: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                menuList[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                  "Rs. " +
                                                      menuList[index]['price']
                                                          .toString(),
                                                  style: GoogleFonts.davidLibre(
                                                      fontSize: 21,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                          );
                        });
                  })
            ],
          ),
          cartList.length > 0
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cartList.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index != cartList.length
                              ? checkoutBottomItem(
                                  index,
                                )
                              : InkWell(
                                  onTap: () {
                                    removeDuplicatesFromCartList();
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8),
                                    width: 75,
                                    height: 75,
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Color(0Xff69bcfc)
                                              .withOpacity(0.5),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                            child: new Icon(
                                              Icons.send,
                                              size: 33,
                                              color: Colours.yellow,
                                            )),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

void removeDuplicatesFromCartList() {
  haveOrder=true;
  FirebaseFirestore.instance.collection("orders").doc(code_all).set({'time':DateFormat.jm().format(DateTime.now())+"AM"});

  for (int i = 0; i < cartList.length; i++) {
    if (cartListMap[cartList[i]['img']]! > 0) {
      int qty = cartListMap[cartList[i]['img']]!;
      cartListMap.update(cartList[i]['img'], (value) => 0);
      FirebaseFirestore.instance
          .collection("orders")
          .doc(code_all)
          .collection("orderDetails")
          .doc(cartList[i]['name'])
          .set({
        'cust_name': Custname,
        'img': cartList[i]['img'],
        'name': cartList[i]['name'],
        'qty': qty,
        'rs': cartList[i]['price'],
        'token': Custtoken,
        'tableno': code_all,
        'isComplete':false
      });
    }
  }
  cartList.clear();
}

// void showTodaySpecial() {

//     ,
//     );
// }

class checkoutBottomItem extends StatefulWidget {
  final int index;
  checkoutBottomItem(this.index);

  @override
  State<checkoutBottomItem> createState() => _checkoutBottomItemState();
}

class _checkoutBottomItemState extends State<checkoutBottomItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      width: 75,
      height: 75,
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0Xff69bcfc).withOpacity(0.5),
          )
        ],
        shape: BoxShape.circle,
      ),
      child: Container(
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: new Image.network(
                cartList[widget.index]['img'],
                width: 70,
                height: 70,
              )),
        ),
      ),
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
  final bool isSelected;
  int index;
  Function changeCurrent;
  CategoriesList(
      {Key? key,
      required this.index,
      required this.isSelected,
      required this.changeCurrent})
      : super(key: key);
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.changeCurrent(widget.index);
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, left: 10),
        width: 105,
        decoration: BoxDecoration(
            gradient: widget.isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colours.yellow, Colours.yellow])
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colours.icon_color, Colours.icon_color]),
            border: Border.all(
                color: widget.isSelected ? Colours.dark : Colours.lightdark),
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
                    color: widget.isSelected ? Colours.dark : Colours.dark),
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
