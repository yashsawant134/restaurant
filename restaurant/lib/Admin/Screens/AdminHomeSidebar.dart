import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Admin/Screens/AdminHome.dart';
import 'package:restaurant/Constants/Colours.dart';

class SeatedPersonsItem extends StatefulWidget {
  String cust_name, time, token, table_no;
  SeatedPersonsItem(
      {Key? key,
      required this.cust_name,
      required this.time,
      required this.token,
      required this.table_no})
      : super(key: key);

  @override
  State<SeatedPersonsItem> createState() => _SeatedPersonsItemState();
}

var tablesDetails = [];

class _SeatedPersonsItemState extends State<SeatedPersonsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.6,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2D37),
                ),
                child: Center(
                  child: Text(
                    widget.time + "\nPM",
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 156, 161),
                        fontSize: 19),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cust_name,
                    style: TextStyle(
                        color: Color.fromARGB(255, 169, 172, 179),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.token.substring(0, 18),
                    style: TextStyle(
                        color: Color.fromARGB(255, 95, 98, 108),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 60,
            height: 30,
            decoration:
                BoxDecoration(border: Border.all(color: Colours.yellow)),
            child: Center(
                child: Text(
              widget.table_no,
              style: TextStyle(fontSize: 17, color: Colours.yellow),
            )),
          )
        ],
      ),
    );
  }
}

class ReservationSideBarBody extends StatefulWidget {
  const ReservationSideBarBody({Key? key}) : super(key: key);

  @override
  State<ReservationSideBarBody> createState() => _ReservationSideBarBodyState();
}

class _ReservationSideBarBodyState extends State<ReservationSideBarBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Seated",
              style: TextStyle(
                  color: Color(0xFF2E648E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/png/avatar.png",
                  color: Color(0xFF2E648E),
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  tablesDetails.length.toString(),
                  style: TextStyle(
                      color: Color(0xFF2E648E),
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("tables").snapshots(),
            builder: (context, tablesnapshot) {
              if (tablesnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var tables = tablesnapshot.data!.docs;
              tablesDetails.clear();
              for (int i = 0; i < tables.length; i++) {
                if (tables[i]['isfull']) tablesDetails.add(tables[i]);
              }
              return tablesDetails.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: tablesDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SeatedPersonsItem(
                          cust_name: tablesDetails[index]['cust_name'],
                          time: tablesDetails[index]['time'],
                          token: tablesDetails[index]['token'],
                          table_no: tablesDetails[index].id.toString(),
                        );
                      })
                  : Container(
                      width: MediaQuery.of(context).size.width / 4.6,
                      height: 200,
                      child: Center(
                        child: Text("Currently no customer were seated",
                            style: TextStyle(color: Colors.white)),
                      ),
                    );
            }),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Already Booked",
              style: TextStyle(
                  color: Color(0xFF2E648E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("booked_table")
                .snapshots(),
            builder: (context, tablesnapshot) {
              if (tablesnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var Booked_tables = tablesnapshot.data!.docs;

              return Booked_tables.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: Booked_tables.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colours.yellow)),
                            width: MediaQuery.of(context).size.width / 4.6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            Booked_tables[index]['name'],
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 169, 172, 179),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Booked_tables[index]['table_id'],
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 124, 125, 128),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Count :",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 169, 172, 179),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Booked_tables[index]['num_of_people']
                                                .toString(),
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 124, 125, 128),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            Booked_tables[index]['date'],
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 124, 125, 128),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Booked_tables[index]['time']
                                                .toString()+" AM",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 124, 125, 128),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: (){
                                         FirebaseFirestore.instance
                .collection("booked_table").doc(Booked_tables[index].id).delete();
                                      },
                                      child: Icon(Icons.cancel_outlined,color:Colors.red,size: 40,)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : Container(
                      width: MediaQuery.of(context).size.width / 4.6,
                      height: 200,
                      child: Center(
                        child: Text("Their is no booing at this time",
                            style: TextStyle(color: Colors.white)),
                      ),
                    );
            }),
      ],
    );
  }
}
