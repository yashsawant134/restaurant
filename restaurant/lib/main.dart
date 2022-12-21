import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:restaurant/Admin/Screens/AdminHome.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:restaurant/screens/LoginScreen.dart';
import 'package:restaurant/screens/MenuScreen.dart';
import 'package:restaurant/screens/TableBooking.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

String apiKey =
    "AAAABPagjfU:APA91bGc640Gn1vt8H9nC2U3zulbPIoASFFjYmNHXnXkLmxfZdTltULLKGuC97dmqr2ed9pe0_70Clo_eO5CzkXpViECcBkbek-tcZY39P11nNnjyNULTm324n56Z46Rte_hDB3QoASV";
String senderId = "21317586421";
String appId = "1:21317586421:android:f9cabe882aa3830ab924bc";
String projectId = "restaurantapp-f3d17";

String OneSignalAppId = "0ec1ab40-6504-442f-b39e-992eff7ff152";

String? userName;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: senderId,
      projectId: projectId,
    ),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userName=prefs.getString("userName");
  runApp(MyApp());
}
final Stream<QuerySnapshot> special =
      FirebaseFirestore.instance.collection("today_dish").snapshots();


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
    super.initState();
    configOneSignel();
  }

  void configOneSignel() {
    OneSignal.shared.setAppId(OneSignalAppId);
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: userName==null?AdminHome():BottomNavBar(special),  //LoginScreen,AdminHome
    );
  }
}
