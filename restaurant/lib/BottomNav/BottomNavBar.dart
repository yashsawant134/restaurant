import 'package:flutter/material.dart';
import 'package:restaurant/screens/Home.dart';
import 'package:restaurant/screens/TableBooking.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:restaurant/screens/profile.dart';
import 'package:restaurant/screens/wallet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

int pageIndex =0;

final ScreenPages = [
  HomeScreen(),
  TableBooking(),
  Wallet(),
  Profile()
];

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {

       Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Colours.yellow;
    final secondaryColor = Colours.icon_color;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colours.dark;
    print(pageIndex);
    return Scaffold(
        backgroundColor: Colours.lightdark,
        body: ScreenPages[pageIndex],
        bottomNavigationBar:BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: Colours.yellow,
                child: Image.asset("assets/png/scan.png",height: 28,width: 28,),
                elevation: 0.1,
                onPressed: () {}),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: "assets/png/foodtray.png",
                  selected: pageIndex == 0,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Search",
                  icon: "assets/png/dinnertable.png",
                  selected: pageIndex == 1,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                SizedBox(width: 56),
                NavBarIcon(
                    text: "Cart",
                    icon: "assets/png/wallet.png",
                    selected: pageIndex == 2,
                    onPressed: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "Calendar",
                  icon: "assets/png/avatar.png",
                  selected: pageIndex == 3,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    )
  );
  }
}


class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final String icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Image.asset(
            icon,
            height: 28,
            width: 28,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
