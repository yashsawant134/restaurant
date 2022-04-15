import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/MenuScreen.dart';
import 'package:restaurant/screens/TableBooking.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
//import 'package:translator/translator.dart';

final Stream<QuerySnapshot> special =
    FirebaseFirestore.instance.collection("today_dish").snapshots();

final Stream<QuerySnapshot> resto_menu =
    FirebaseFirestore.instance.collection("resto_menu").snapshots();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(resto_menu, special),
    );
  }
}
