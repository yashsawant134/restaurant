import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/Admin/Screens/AdminHomeProcessOrderScreen.dart';
import 'package:restaurant/Admin/Screens/AdminHomeSidebar.dart';
import 'package:restaurant/Admin/Screens/AdminHomeTableView.dart';
import 'package:restaurant/Constants/Colours.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

int flag = 0;
int orderSelectedNumber = 0;
String orderDocId="";
var orderList=[];
class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4.24,
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xFF313640),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      setState(() {
                                        flag = 0;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          9.2,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF313640),
                                          border: Border.all(
                                              color: flag == 0
                                                  ? Color(0xFF4E7199)
                                                  : Color(0xFF5B616A))),
                                      child: Center(
                                        child: Text(
                                          "Reservation",
                                          style: TextStyle(
                                              color: flag == 0
                                                  ? Color(0xFF4E7199)
                                                  : Color(0xFF5B616A),
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      setState(() {
                                        flag = 1;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          9.2,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF313640),
                                          border: Border.all(
                                              color: flag == 1
                                                  ? Color(0xFF4E7199)
                                                  : Color(0xFF5B616A))),
                                      child: Center(
                                        child: Text(
                                          "Order",
                                          style: TextStyle(
                                              color: flag == 1
                                                  ? Color(0xFF4E7199)
                                                  : Color(0xFF5B616A),
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              flag == 0
                                  ? ReservationSideBarBody()
                                  : Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Orders",
                                              style: TextStyle(
                                                  color: Color(0xFF2E648E),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection("orders")
                                                .snapshots(),
                                            builder: (context, ordersnapshot) {
                                              if (ordersnapshot
                                                      .connectionState ==
                                                  ConnectionState.waiting) {
                                                    
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                               orderList=ordersnapshot.data!.docs;
                                               
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: orderList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            orderSelectedNumber =
                                                                index;
                                                          });
                                                        },
                                                        child: OrderItemRow(
                                                          orderSelectedNumber:
                                                              orderSelectedNumber,
                                                          index: index,
                                                          time: orderList[index]['time'],
                                                        ));
                                                  });
                                            })
                                      ],
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            flag == 0
                ? AdminHomeTableView()
                :orderList.length>0? AdminHomeProcessOrderScreen(
                    orderId: orderList[orderSelectedNumber].id,
                    
                  ):Container(
                     width: MediaQuery.of(context).size.width / 1.30899,
      color: Color(0xFF2A2D37),
                  ),
          ],
        ),
      ),
    );
  }
}

class OrderItemRow extends StatefulWidget {
  int orderSelectedNumber;
  int index;
  String time;
  OrderItemRow(
      {Key? key, required this.orderSelectedNumber, required this.index,required this.time})
      : super(key: key);

  @override
  State<OrderItemRow> createState() => _OrderItemRowState();
}

class _OrderItemRowState extends State<OrderItemRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 4.6,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromARGB(255, 85, 90, 106),
      ),
      child: Row(
        children: [
          widget.orderSelectedNumber == widget.index
              ? Container(
                  width: 10,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: Color.fromARGB(255, 51, 67, 119),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 17, left: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order  #00132",
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 163, 200),
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.alarm, color: Color.fromARGB(255, 41, 42, 64)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Today, "+widget.time,
                      style: TextStyle(
                          color: Color.fromARGB(255, 41, 42, 64),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
