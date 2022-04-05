import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/Admin/Screens/AdminHome.dart';
import 'package:restaurant/BottomNav/BottomNavBar.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:http/http.dart';

class AdminHomeProcessOrderScreen extends StatefulWidget {
  String orderId;
  AdminHomeProcessOrderScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<AdminHomeProcessOrderScreen> createState() =>
      _AdminHomeProcessOrderScreenState();
}

var orderDishList = [];

class _AdminHomeProcessOrderScreenState
    extends State<AdminHomeProcessOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.30899,
      color: Color(0xFF2A2D37),
      child: Center(
          child: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("orders")
                  .doc(widget.orderId)
                  .collection("orderDetails")
                  .snapshots(),
              builder: (context, ordersnapshot) {
                if (ordersnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                orderDishList = ordersnapshot.data!.docs;
                var totalCost = 0;
                for (int i = 0; i < orderDishList.length; i++) {
                  totalCost +=
                      (orderDishList[i]['rs'] * orderDishList[i]['qty']) as int;
                }
                return orderDishList.length > 0
                    ? Container(
                        width: MediaQuery.of(context).size.width / 1.30899,
                        margin: EdgeInsets.only(top: 90, left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task info",
                              style: TextStyle(
                                  color: Color(0xFF2E648E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order time",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 66, 104, 133),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "10:35:20s",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 133, 170),
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Table No.",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 66, 104, 133),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Table Number " +
                                          widget.orderId.substring(1, 2),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 133, 170),
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Name",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 66, 104, 133),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      orderDishList[0]['cust_name'],
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 133, 170),
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: orderDishList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return OrderRow(index: index,orderId:widget.orderId);
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Rs " + totalCost.toString(),
                                      style: TextStyle(
                                          color: Color(0xFF2E648E),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        List<String> tokenList = [];
                                        tokenList
                                            .add(orderDishList[0]['token']);
                                        String heading = "Hey " +
                                            orderDishList[0]['cust_name'];
                                        String content =
                                            "Your order is completed sir please collect";
                                        sendNotification(
                                            tokenList, content, heading);

                                        FirebaseFirestore.instance
                                            .collection("orders")
                                            .doc(widget.orderId)
                                            .collection("orderDetails")
                                            .get()
                                            .then((value) {
                                          value.docs.forEach((element) {
                                            FirebaseFirestore.instance
                                                .collection("orders")
                                                .doc(widget.orderId)
                                                .collection("orderDetails")
                                                .doc(element.id)
                                                .delete()
                                                .then((value) {
                                              print("Success!");
                                            });
                                          });
                                        });
                                        setState(() {
                                          deleteMainRoot();
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.amber[400],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Proceed",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 31, 32, 33),
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width / 1.30899,
                        color: Color(0xFF2A2D37),
                      );
              })
        ],
      )),
    );
  }

  void deleteMainRoot() async {
    try {
      FirebaseFirestore.instance
          .collection("orders")
          .doc(widget.orderId)
          .delete();
      Fluttertoast.showToast(
        msg: widget.orderId.toString(), // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(), // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
      );
    }
  }

  Future<Response> sendNotification(
      List<String> tokenIdList, String contents, String heading) async {
    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "app_id":
            "0ec1ab40-6504-442f-b39e-992eff7ff152", //kAppId is the App Id that one get from the OneSignal When the application is registered.

        "include_player_ids":
            tokenIdList, //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

        // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color": "FF9976D2",

        "small_icon": "ic_stat_onesignal_default",

        "large_icon": orderDishList[0]['img'],

        "headings": {"en": heading},

        "contents": {"en": contents},
      }),
    );
  }
}

class OrderRow extends StatefulWidget {
  int index;
  String orderId;
  OrderRow({Key? key, required this.index,required this.orderId}) : super(key: key);

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      width: MediaQuery.of(context).size.width / 1.30899,
      height: 100,
      color: Colours.dark.withOpacity(0.3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.network(
              orderDishList[widget.index]['img'],
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(
            width: 200,
          ),
          Container(
            width: 150,
            child: Text(
              orderDishList[widget.index]['name'],
              style: TextStyle(
                  color: Color(0xFF2E648E),
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 150,
          ),
          Text(
            "x" + orderDishList[widget.index]['qty'].toString(),
            style: TextStyle(
                color: Color(0xFF2E648E),
                fontSize: 19,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 150,
          ),
          Text(
            "Rs " +
                (orderDishList[widget.index]['rs'] *
                        orderDishList[widget.index]['qty'])
                    .toString(),
            style: TextStyle(
                color: Color.fromARGB(255, 205, 216, 79),
                fontSize: 19,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 100,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              
                onPressed: () {
                  if(!orderDishList[widget.index]['isComplete'])FirebaseFirestore.instance.collection("orders").doc(widget.orderId).collection("orderDetails").doc(orderDishList[widget.index].id).update({'isComplete':true});
                },
                style: ElevatedButton.styleFrom(
                  
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: !orderDishList[widget.index]['isComplete']? Text('Pending'): Text('Completed')),
          )
        ],
      ),
    );
  }
}
