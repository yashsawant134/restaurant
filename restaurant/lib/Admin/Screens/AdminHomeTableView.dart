import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';

class AdminHomeTableView extends StatefulWidget {
  AdminHomeTableView({Key? key}) : super(key: key);

  @override
  State<AdminHomeTableView> createState() => _AdminHomeTableViewState();
}

var tablesList = [];

class _AdminHomeTableViewState extends State<AdminHomeTableView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.30899,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF2A2D37),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("tables").snapshots(),
            builder: (context, tablesnapshot) {
              if (tablesnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              tablesList = tablesnapshot.data!.docs;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///////////////// TABLE 1
                      InkWell(
                        onTap:() {
                        if( tablesList[0]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T1").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[0].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[0]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[0]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[0]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[0]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///////////////////   TABLE  2

                       InkWell(
                          onTap:() {
                        if( tablesList[1]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T2").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                         child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[1].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[1]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[1]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[1]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[1]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                                             ),
                       ),

                      ////////////////////////////TABLE   3
                      ///
                      ///
                      ///
                      InkWell(
                         onTap:() {
                        if( tablesList[2]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T3").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[2].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[2]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[2]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[2]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[2]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
 ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///////////////// TABLE 1
                      InkWell(
                         onTap:() {
                        if( tablesList[3]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T4").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[3].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[3]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[3]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[3]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[3]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///////////////////   TABLE  2

                      InkWell(
                         onTap:() {
                        if( tablesList[4]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T5").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[4].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[4]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[4]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[4]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[4]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ////////////////////////////TABLE   3
                      ///
                      ///
                      ///
                      InkWell(
                         onTap:() {
                        if( tablesList[5]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T6").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[5].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[5]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[5]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[5]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[5]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///////////////// TABLE 1
                       InkWell(
                          onTap:() {
                        if( tablesList[6]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T7").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                         child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[6].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[6]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[6]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[6]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[6]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                                             ),
                       ),

                      ///////////////////   TABLE  2

                      InkWell(
                         onTap:() {
                        if( tablesList[7]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T8").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[7].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[7]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[7]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[7]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[7]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ////////////////////////////TABLE   3
                      ///
                      ///
                      ///
                       InkWell(
                          onTap:() {
                        if( tablesList[8]['isfull']){
                          FirebaseFirestore.instance.collection('tables').doc("T9").update({'cust_name':"",'isfull':false,'time':"",'token':""});
                        }
                      },
                         child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 72, 85),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10,
                                              top: 10,
                                              left: 20,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(tablesList[8].id,
                                                  style: TextStyle(
                                                    color: Color(0xFF697079),
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                   tablesList[8]['cust_name'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                   tablesList[8]['isfull']? "Occupied":"Vacant",
                                                    style: TextStyle(
                                                        color:  tablesList[8]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: tablesList[8]['isfull']?Color(0xFF92D4D2):Color(0xFF5DBB47),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(28),
                                            bottomRight: Radius.circular(28)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 65, 72, 85),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                                             ),
                       ),
],
                  )
                ],
              );
            }));
  }
}
