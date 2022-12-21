import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:restaurant/Admin/Screens/AdminHome.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/restaurantLoginBg.jpg"),
                fit: BoxFit.cover,
                opacity: 1),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                top: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white),
                      child: Center(
                        child: QrImage(
                          data: Custtoken.toString(),
                          size: 210,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 90,
                child: Column(
                  children: [
                    Text(
                      lang_code=="1" ? "Hi" :"हैलो",
                      style: GoogleFonts.davidLibre(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Custname!,
                      style: GoogleFonts.davidLibre(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
