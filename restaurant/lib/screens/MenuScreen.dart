import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int current = 0;
  void changeCurrent(int n) {
    setState(() {
      current = n;
    });
  }

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
      body: ListView(
        children: [
          SizedBox(
            height: 20,
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
                          borderRadius: BorderRadius.all(Radius.circular(28))),
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
                          child: Image.asset(
                        "assets/png/burgger.png",
                        width: 190,
                        height: 190,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Crispy aloo patty",
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
          InkWell(
            onTap: () {
              showDetails();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colours.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
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
                borderRadius: BorderRadius.all(Radius.circular(25))),
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
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                color: Colours.yellow,
                borderRadius: BorderRadius.all(Radius.circular(25))),
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
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                color: Colours.yellow,
                borderRadius: BorderRadius.all(Radius.circular(25))),
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
        ],
      ),
    );
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
    "name": "Salads",
  },
  {
    "icon": "assets/png/ayurvedic.png",
    "name": "Pizza's",
  },
  {"icon": "assets/png/homeo.png", "name": "Burgger's"},
  {"icon": "assets/png/homeo.png", "name": "Thali"},
  {"icon": "assets/png/homeo.png", "name": "Fast"}
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
