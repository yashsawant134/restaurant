import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:restaurant/Admin/Screens/AdminHome.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController nameController = new TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 20),
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
                  Text(
                    "We're their to provide you best service",
                    style: GoogleFonts.davidLibre(
                        fontSize: 28,
                        color: Colours.yellow,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          focusColor: Colors.amber,
                          suffixIcon: Icon(Icons.person_outline_rounded)),
                      onSubmitted: (newValue) {},
                      controller: nameController,
                    ),
                  ),

                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){
                      addTokenAndName(nameController.text);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomNavBar(special)));
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
                              "That's my name",
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
          ],
        ),
      ),
    );
  }
}

void addTokenAndName(String name) async{
 final status = await OneSignal.shared.getDeviceState();
    final String? token = status?.userId;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userName', name);
  prefs.setString("token", token!);
   Fluttertoast.showToast(
      msg:   token, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.CENTER, // location
    );

    List<String> list=[];
    list.add(prefs.getString("token")!);
    sendNotification(list, "Login", "Hello Yash");
}

Future<Response> sendNotification(List<String> tokenIdList, String contents, String heading) async{

    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>
      {
        "app_id": OneSignalAppId,//kAppId is the App Id that one get from the OneSignal When the application is registered.
          
        "include_player_ids": tokenIdList,//tokenIdList Is the List of All the Token Id to to Whom notification must be sent.
          
          // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color":"FF9976D2",
          
        "small_icon":"ic_stat_onesignal_default",
        
        "large_icon":"https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",
          
        "headings": {"en": heading},
          
        "contents": {"en": contents},
          
        
      }),
    );
  }